import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Aylanataymer extends StatefulWidget {
  final int initialMinutes;
  final VoidCallback? onTimerComplete;

  const Aylanataymer({
    super.key,
    required this.initialMinutes,
    required this.onTimerComplete,
  });

  @override
  State<Aylanataymer> createState() => _CircularTimerWidgetState();
}

class _CircularTimerWidgetState extends State<Aylanataymer> {
  late int _totalSeconds;
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.initialMinutes * 60;
    _remainingSeconds = _totalSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        if (widget.onTimerComplete != null) {
          widget.onTimerComplete!();
        }
      }
    });
  }

  void _addOneMinute() {
    setState(() {
      _remainingSeconds += 60;
      _totalSeconds += 60;
    });
  }

  void _resetTimer() {
    setState(() {
      _totalSeconds = widget.initialMinutes * 60;
      _remainingSeconds = _totalSeconds;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final double percent = _totalSeconds > 0
        ? (_remainingSeconds / _totalSeconds).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 90.0,
          lineWidth: 10.0,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Cols.primery, 
          backgroundColor: const Color(0xFF2C2C2E), 
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_none_rounded,
                color: Cols.primery,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                _formatTime(_remainingSeconds),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              // "QOLGAN VAQT" matni
              const Text(
                "QOLGAN VAQT",
                style: TextStyle(
                  color: Color(0xFF8E8E93),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(title: "+1 daq", onTap: _addOneMinute),
            const SizedBox(width: 10),
            _buildActionButton(title: "Qayta o'rnatish", onTap: _resetTimer),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
