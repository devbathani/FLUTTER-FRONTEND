import 'package:flutter/material.dart';

class TimerTextWidget extends StatelessWidget {
  const TimerTextWidget(
      {super.key,
      required this.time,
      required this.fontColor,
      required this.fontSize,
      required this.timeFormat,
      required this.timeFormatFontSize});
  final String time;
  final String timeFormat;
  final Color fontColor;
  final double fontSize;
  final double timeFormatFontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          timeFormat,
          style: TextStyle(
            color: fontColor,
            fontSize: timeFormatFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
