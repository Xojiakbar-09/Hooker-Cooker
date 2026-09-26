// Auto-playing splash version of the React + framer-motion `IntroAnimation`.
// Timeline: scatter → line (0.5s) → circle (2.5s) → circle morphs into the
// bottom arc and shuffles (auto) → navigates to [IntroAnimation.nextPage].
// No user input needed. No extra packages.

import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const double _imgW = 60;
const double _imgH = 85;
const double _maxScroll = 3000; // same virtual range as the original

const _defaultImageUrls = [
  'https://cdn.21st.dev/assets/mirror/4d/4d1bff4ea8b9f400dff7ae405f92e15bd39ec76e9285c7d96017e64ba1de3ae1.jpg',
  'https://cdn.21st.dev/assets/mirror/ee/ee36e332fe99d7611c43b90511db08a4f84e4545caa78e7b52e9ccffe273864b.jpg',
  'https://cdn.21st.dev/assets/mirror/dd/dddeaa4e6132c65bf7ff99d197f792a30937b5cbfe97a2b1ee54a793684df52e.jpg',
  'https://cdn.21st.dev/assets/mirror/48/487977107b5011b5e1c25289f6e4393ef555e1a92daee554788e9363b233ca14.jpg',
  'https://cdn.21st.dev/assets/mirror/a1/a12509688be6c9d3b2cb26d2ea1cfce48b8a8dbf2653e17be8a3fc31bd69f162.jpg',
  'https://cdn.21st.dev/assets/mirror/05/051f9e565b5b0b221384d9c27a0760febc3fb48d190c046adfda579f3614c958.jpg',
  'https://cdn.21st.dev/assets/mirror/87/87d4f60a4465d19d14b8acefa46275df4ccd767ccea6d7f234ea5bad99cfec56.jpg',
  'https://cdn.21st.dev/assets/mirror/06/0610989e0675a12c02d35aa5464e2644bf77913214b748b73a894808d2d79877.jpg',
  'https://cdn.21st.dev/assets/mirror/fe/fe90b90751e671a9526134c4743e2fcbf6c1a24991aba273ad7418c88fc9c701.jpg',
  'https://cdn.21st.dev/assets/mirror/2e/2e0452c1994fcc2130a1b8ef68e34b5ea52d1b35b80dde09b99349ad1de54598.jpg',
  'https://cdn.21st.dev/assets/mirror/84/847dc523558808119dc4bbb5218ff862ae5f5b455f33e9a0304f2f5a4b2f0f2c.jpg',
  'https://cdn.21st.dev/assets/mirror/2f/2f128763d177d6bdda3de9f0a766693406034977082bdb542138b7b74af9697b.jpg',
  'https://cdn.21st.dev/assets/mirror/30/30f8223f1d1ecc24fc8b7a9995b8ee98449b1e9fc300c14fbccec01b6a83a0ae.jpg',
  'https://cdn.21st.dev/assets/mirror/b4/b4df0e3e425ffce3b4f62fd7bc717e4dc90b94455f4d65d64fc07fe9721b0519.jpg',
  'https://cdn.21st.dev/assets/mirror/90/90c625659f072e4a701c2e37fa4ca46f25c7ca8689d723e7802fe84cf17874e9.jpg',
  'https://cdn.21st.dev/assets/mirror/6a/6aa0befc69cc3db8f3f3558d4b5e1216a5b64ceae1b86f51acf1c3f1432a8cf7.jpg',
  'https://cdn.21st.dev/assets/mirror/dc/dc126cfd753dc217945d0ea2f915e539dfe4ffb5fdea02245d0f576b25a9c4dd.jpg',
  'https://cdn.21st.dev/assets/mirror/ab/ab5f167fcb763aee7c3247fb8af97875998a7f519a6119da7dadd9cf73ae1a2c.jpg',
  'https://cdn.21st.dev/assets/mirror/57/57d6e450f7068e5f3be04907dcc0815343e67df1dc82f2da0ff1c859afc1f700.jpg',
  'https://cdn.21st.dev/assets/mirror/e4/e491359016d1494074e287dfbb55be068cffc0110017ae2257a5d4cdec193a47.jpg',
];

enum _Phase { scatter, line, circle }

class IntroAnimation extends StatefulWidget {
  const IntroAnimation({
    super.key,
    required this.nextPage,
    this.images,
    this.arcDelay = const Duration(milliseconds: 1500),
    this.arcDuration = const Duration(seconds: 4),
    this.holdAtEnd = const Duration(milliseconds: 600),
    this.transitionDuration = const Duration(milliseconds: 500),
    this.introTitle = 'The future is built on AI.',
    this.headline = 'Explore Our Vision',
    this.description = 'Discover a world where technology meets creativity. '
        'A curated collection of innovations designed to shape the future.',
  });

  /// Page shown after the animation (replaces the splash, no back button).
  final Widget nextPage;

  /// Card images. Use `AssetImage`s in production so nothing loads late.
  final List<ImageProvider>? images;

  /// How long the circle (with the intro title) is shown before morphing.
  final Duration arcDelay;

  /// Duration of the circle → arc morph + shuffle (was scroll-driven).
  final Duration arcDuration;

  /// Pause on the final frame before navigating.
  final Duration holdAtEnd;

  /// Fade duration into [nextPage].
  final Duration transitionDuration;

  final String introTitle;
  final String headline;
  final String description;

  @override
  State<IntroAnimation> createState() => _IntroAnimationState();
}

class _IntroAnimationState extends State<IntroAnimation> with TickerProviderStateMixin {
  late final List<ImageProvider> _images =
      widget.images ?? [for (final u in _defaultImageUrls) NetworkImage(u)];

  _Phase _phase = _Phase.scatter;
  Size _size = Size.zero;

  double _scroll = 0; // auto-driven virtual scroll
  bool _autoScrolling = false;
  final _morph = _Spring(0, stiffness: 40, damping: 20); // scroll [0,600] → [0,1]
  final _rotate = _Spring(0, stiffness: 40, damping: 20); // scroll [600,3000] → [0,360]

  late final List<_CardMotion> _cards;
  late final Ticker _ticker;
  late final AnimationController _introText;
  Duration _last = Duration.zero;

  final List<Timer> _timers = [];
  bool _finished = false;
  bool _precached = false;

  @override
  void initState() {
    super.initState();
    final rng = math.Random();
    _cards = [
      for (var i = 0; i < _images.length; i++)
        _CardMotion(_Pose(
          (rng.nextDouble() - 0.5) * 1500,
          (rng.nextDouble() - 0.5) * 1000,
          (rng.nextDouble() - 0.5) * 180,
          0.6,
          0,
        )),
    ];
    _introText = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _ticker = createTicker(_onTick)..start();

    _timers
      ..add(Timer(const Duration(milliseconds: 500), () => _phase = _Phase.line))
      ..add(Timer(const Duration(milliseconds: 2500), () {
        _phase = _Phase.circle;
        _introText.forward();
        _timers.add(Timer(widget.arcDelay, () => _autoScrolling = true));
      }));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) return;
    _precached = true;
    for (final img in _images) {
      precacheImage(img, context, onError: (_, __) {});
    }
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    _ticker.dispose();
    _introText.dispose();
    super.dispose();
  }

  // ─── Frame loop ──────────────────────────────────────────────────────────

  void _onTick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 1 / 30);
    _last = elapsed;

    if (_autoScrolling) {
      _scroll = math.min(_scroll + _maxScroll * dt * 1e6 / widget.arcDuration.inMicroseconds, _maxScroll);
      _morph.target = (_scroll / 600).clamp(0.0, 1.0);
      _rotate.target = ((_scroll - 600) / (_maxScroll - 600) * 360).clamp(0.0, 360.0);
      if (_scroll >= _maxScroll) _autoScrolling = false;
    }

    _morph.step(dt);
    _rotate.step(dt);

    if (_size.width > 0) {
      for (var i = 0; i < _cards.length; i++) {
        _cards[i].aim(_targetFor(i));
      }
    }
    for (final c in _cards) {
      c.step(dt);
    }

    if (!_finished && _scroll >= _maxScroll && (_rotate.value - 360).abs() < 1) {
      _finished = true;
      _timers.add(Timer(widget.holdAtEnd, _goNext));
    }

    setState(() {});
  }

  void _goNext() {
    if (!mounted) return;
    _ticker.stop();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: widget.transitionDuration,
        pageBuilder: (_, __, ___) => widget.nextPage,
        transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  _Pose _targetFor(int i) {
    final n = _cards.length;
    switch (_phase) {
      case _Phase.scatter:
        return _cards[i].scatter;
      case _Phase.line:
        const spacing = 70.0;
        return _Pose(i * spacing - n * spacing / 2, 0, 0, 1, 1);
      case _Phase.circle:
        return _circleArcPose(i, n);
    }
  }

  _Pose _circleArcPose(int i, int n) {
    final w = _size.width, h = _size.height;
    final isMobile = w < 768;

    // A. circle
    final circleRadius = math.min(math.min(w, h) * 0.35, 350.0);
    final circleAngle = i / n * 360;
    final cr = circleAngle * math.pi / 180;
    final cx = math.cos(cr) * circleRadius;
    final cy = math.sin(cr) * circleRadius;

    // B. bottom "rainbow" arc
    final arcRadius = math.min(w, h * 1.5) * (isMobile ? 1.4 : 1.1);
    final arcCenterY = h * (isMobile ? 0.35 : 0.25) + arcRadius;
    final spread = isMobile ? 100.0 : 130.0;
    final step = n > 1 ? spread / (n - 1) : 0.0;
    final progress = (_rotate.value / 360).clamp(0.0, 1.0);
    final arcAngle = -90 - spread / 2 + i * step - progress * spread * 0.8;
    final ar = arcAngle * math.pi / 180;
    final ax = math.cos(ar) * arcRadius;
    final ay = math.sin(ar) * arcRadius + arcCenterY;

    // C. morph
    final m = _morph.value;
    return _Pose(
      ui.lerpDouble(cx, ax, m)!,
      ui.lerpDouble(cy, ay, m)!,
      ui.lerpDouble(circleAngle + 90, arcAngle + 90, m)!,
      ui.lerpDouble(1, isMobile ? 1.4 : 1.8, m)!,
      1,
    );
  }

  // ─── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFAFAFA),
      child: LayoutBuilder(
        builder: (context, constraints) {
          _size = constraints.biggest;
          final center = _size.center(Offset.zero);
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: _IntroText(controller: _introText, morph: _morph.value, text: widget.introTitle),
              ),
              for (var i = 0; i < _cards.length; i++) _card(i, center),
              _ArcContent(
                top: _size.height * 0.1,
                morph: _morph.value,
                headline: widget.headline,
                description: widget.description,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _card(int i, Offset center) {
    final c = _cards[i];
    return Positioned(
      left: center.dx + c.x.value - _imgW / 2,
      top: center.dy + c.y.value - _imgH / 2,
      width: _imgW,
      height: _imgH,
      child: Opacity(
        opacity: c.opacity.value.clamp(0.0, 1.0),
        child: Transform.rotate(
          angle: c.rotation.value * math.pi / 180,
          child: Transform.scale(scale: c.scale.value, child: _Card(image: _images[i])),
        ),
      ),
    );
  }
}

// ─── Texts ─────────────────────────────────────────────────────────────────

class _IntroText extends StatelessWidget {
  const _IntroText({required this.controller, required this.morph, required this.text});

  final AnimationController controller;
  final double morph;
  final String text;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final t = Curves.easeOut.transform(controller.value);
            final blur = 10 * (1 - t);
            Widget title = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  color: Color(0xFF1F2937),
                ),
              ),
            );
            if (blur > 0.01) {
              title = ImageFiltered(imageFilter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur), child: title);
            }
            return Transform.translate(
              offset: Offset(0, 20 * (1 - t)),
              child: Opacity(opacity: t * (1 - morph * 2).clamp(0.0, 1.0), child: title),
            );
          },
        ),
      ),
    );
  }
}

class _ArcContent extends StatelessWidget {
  const _ArcContent({
    required this.top,
    required this.morph,
    required this.headline,
    required this.description,
  });

  final double top;
  final double morph;
  final String headline;
  final String description;

  @override
  Widget build(BuildContext context) {
    final t = ((morph - 0.8) / 0.2).clamp(0.0, 1.0);
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - t)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    headline,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.75,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 512),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, height: 1.625, color: Color(0xFF4B5563)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Card ──────────────────────────────────────────────────────────────────

const _radius = BorderRadius.all(Radius.circular(12)); // rounded-xl

class _Card extends StatelessWidget {
  const _Card({required this.image});

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFFE5E7EB), // bg-gray-200
        borderRadius: _radius,
        boxShadow: [ // shadow-lg
          BoxShadow(color: Color(0x1A000000), offset: Offset(0, 10), blurRadius: 15, spreadRadius: -3),
          BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -4),
        ],
      ),
      child: ClipRRect(
        borderRadius: _radius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: image,
              fit: BoxFit.cover,
              gaplessPlayback: true,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
            const ColoredBox(color: Color(0x1A000000)), // bg-black/10
          ],
        ),
      ),
    );
  }
}

// ─── Physics (framer-motion spring: mass 1, stiffness, damping) ────────────

class _Spring {
  _Spring(this.value, {required this.stiffness, required this.damping}) : target = value;

  double value;
  double target;
  double velocity = 0;
  final double stiffness;
  final double damping;

  bool get isAtRest => (target - value).abs() < 0.001 && velocity.abs() < 0.001;

  void step(double dt) {
    const h = 1 / 240; // sub-steps keep the integration stable
    var remaining = dt;
    while (remaining > 0) {
      final s = math.min(h, remaining);
      final accel = -stiffness * (value - target) - damping * velocity;
      velocity += accel * s;
      value += velocity * s;
      remaining -= s;
    }
    if (isAtRest) {
      value = target;
      velocity = 0;
    }
  }
}

class _Pose {
  const _Pose(this.x, this.y, this.rotation, this.scale, this.opacity);
  final double x, y, rotation, scale, opacity;
}

class _CardMotion {
  _CardMotion(this.scatter)
      : x = _Spring(scatter.x, stiffness: 40, damping: 15),
        y = _Spring(scatter.y, stiffness: 40, damping: 15),
        rotation = _Spring(scatter.rotation, stiffness: 40, damping: 15),
        scale = _Spring(scatter.scale, stiffness: 40, damping: 15),
        opacity = _Spring(scatter.opacity, stiffness: 40, damping: 15);

  final _Pose scatter;
  final _Spring x, y, rotation, scale, opacity;

  void aim(_Pose p) {
    x.target = p.x;
    y.target = p.y;
    rotation.target = p.rotation;
    scale.target = p.scale;
    opacity.target = p.opacity;
  }

  void step(double dt) {
    x.step(dt);
    y.step(dt);
    rotation.step(dt);
    scale.step(dt);
    opacity.step(dt);
  }
}
