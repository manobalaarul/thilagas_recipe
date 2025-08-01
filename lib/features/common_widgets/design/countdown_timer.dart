import 'dart:async';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime endTime;

  const CountdownTimerWidget({Key? key, required this.endTime})
      : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Timer _timer;
  Duration timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    final difference = widget.endTime.difference(now);

    if (difference.isNegative) {
      _timer.cancel();
      setState(() {
        timeLeft = Duration.zero;
      });
      return;
    }

    setState(() {
      timeLeft = difference;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatTime(int value) => value.toString().padLeft(2, '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTimeBox(formatTime(timeLeft.inDays), "Days"),
        _buildTimeBox(formatTime(timeLeft.inHours.remainder(24)), "Hrs"),
        _buildTimeBox(formatTime(timeLeft.inMinutes.remainder(60)), "Mins"),
        _buildTimeBox(formatTime(timeLeft.inSeconds.remainder(60)), "Secs"),
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    var media = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: media.width / 7,
          height: media.height / 16,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppLightColor.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
