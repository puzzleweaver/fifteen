import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final Duration time;
  final Widget Function(BuildContext context, String timeString) builder;

  const TimeDisplay({
    super.key,
    required this.time,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, displayTime);
  }

  String get displayTime {
    int hours = time.inHours,
        minutes = time.inMinutes.remainder(60),
        seconds = time.inSeconds.remainder(60);

    String hourStr = hours == 0 ? "" : "${hours.toString().padLeft(2, "0")}:",
        minuteStr = "${minutes.toString().padLeft(2, '0')}:",
        secondStr = seconds.toString().padLeft(2, '0');

    return "$hourStr$minuteStr$secondStr";
  }
}
