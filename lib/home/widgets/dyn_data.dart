import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/home/widgets/battery_indicator.dart';
import 'package:separated_row/separated_row.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

class DynData extends StatelessWidget {
  const DynData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DynUpdateModel?>(
        stream: RouterService.instance.dynDataSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData == false || snapshot.data == null) {
            return Container();
          }

          return _buildContent(context, snapshot.data!);
        },
    );
  }

  Widget _buildContent(BuildContext context, DynUpdateModel data) {
    return SeparatedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (_, __) => SizedBox(width: 50),
      children: [
        BatteryIndicator(
          size: 25,
          colorful: true,
          mainColor: Colors.deepOrange,
          style: BatteryIndicatorStyle.skeumorphism,
          batteryLevel: data.battery.capacity,
        ),
        SignalStrengthIndicator.bars(
          value: data.signal.modem.level / data.signal.modem.maxLevel,
          barCount: data.signal.modem.maxLevel,
        ),
      ],
    );
  }
}
