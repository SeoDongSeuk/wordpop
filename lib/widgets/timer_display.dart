import 'package:flutter/material.dart';

// 타이머 위젯
class TimerDisplay extends StatelessWidget {
  final int currentTime;
  const TimerDisplay({super.key, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currentTime',
      style: const TextStyle(fontSize: 40, color: Colors.black),
    );
  }
}
