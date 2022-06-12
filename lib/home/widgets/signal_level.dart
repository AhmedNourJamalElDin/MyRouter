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
      message: "Signal level: ${signal.modem.level}",
      triggerMode: TooltipTriggerMode.tap,
      child: SignalStrengthIndicator.bars(
        value: signal.modem.level / signal.modem.maxLevel,
        barCount: signal.modem.maxLevel,
      ),
    );
  }
}
