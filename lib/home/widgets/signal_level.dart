import 'package:flutter/material.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

class SignalLevel extends StatelessWidget {
  final SignalModel signal;

  const SignalLevel({
    required this.signal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Signal level: ${signal.wifi.level}",
      triggerMode: TooltipTriggerMode.tap,
      child: SignalStrengthIndicator.bars(
        value: signal.wifi.level / signal.wifi.maxLevel,
        barCount: signal.wifi.maxLevel,
      ),
    );
  }
}
