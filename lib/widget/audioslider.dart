import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class AudioDialogWidget extends StatefulWidget {
  final String audioUrl;
  const AudioDialogWidget({super.key, required this.audioUrl});

  @override
  State<AudioDialogWidget> createState() => _AudioDialogWidgetState();
}

class _AudioDialogWidgetState extends State<AudioDialogWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Cols.dark,
      title: const Text(
        "Audio qo'llanmani tinglash:",
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          IconButton(
            iconSize: 56,
            color: Cols.orange,
            icon: Icon(
              _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            ),
            onPressed: () async {
              if (_isPlaying) {
                await _audioPlayer.pause();
                setState(() => _isPlaying = false);
              } else {
                await _audioPlayer.play(UrlSource(widget.audioUrl));
                setState(() => _isPlaying = true);
              }
            },
          ),
            Slider(
            min: 0,
            max: _duration.inSeconds.toDouble() > 0
                ? _duration.inSeconds.toDouble()
                : 1.0,
            value: _position.inSeconds.toDouble().clamp(
              0.0,
              _duration.inSeconds.toDouble() > 0
                  ? _duration.inSeconds.toDouble()
                  : 1.0,
            ),
            activeColor: Cols.orange,
            inactiveColor: Colors.grey.withValues(alpha: 0.3),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await _audioPlayer.seek(
                position,
              ); 
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatTime(_position),
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  _formatTime(_duration),
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            ); 
          },
          child: Text('Yopish', style: TextStyle(color: Cols.orange)),
        ),
      ],
    );
  }
}
