import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class RefreshTimer extends StatelessWidget {
  final CountdownTimerController controller;

  const RefreshTimer({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: controller,
      widgetBuilder: (_, time) => Center(
        child: Text(
          buildText(time),
        ),
      ),
    );
  }

  String buildText(CurrentRemainingTime? time) {
    if (time == null) {
      return 'Refreshing!';
    }

    return "Refreshing in " + time.sec.toString().padLeft(2, '0') + " sec";
  }
}
