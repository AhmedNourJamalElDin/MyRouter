import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/home/widgets/battery_indicator.dart';
import 'package:router_setting/home/widgets/client_number.dart';
import 'package:router_setting/home/widgets/modem.dart';
import 'package:router_setting/home/widgets/signal_level.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (_, __) => const SizedBox(width: 50),
      children: [
        SeparatedColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          children: [
            Modem(
              modem: data.signal.modem,
            ),
            if (data.clientNum.ssid1 != 0)
              ClientNumber(
                number: data.clientNum.ssid1,
              ),
            if (data.clientNum.ssid2 != 0)
              ClientNumber(
                number: data.clientNum.ssid2,
              ),
          ],
        ),
        SeparatedColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          children: [
            SignalLevel(
              signal: data.signal,
            ),
            BatteryIndicator(
              size: 25,
              colorful: true,
              mainColor: Colors.deepOrange,
              style: BatteryIndicatorStyle.skeumorphism,
              batteryLevel: data.battery.capacity,
            ),
          ],
        ),
      ],
    );
  }
}
