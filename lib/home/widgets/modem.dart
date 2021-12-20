import 'package:flutter/material.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:separated_column/separated_column.dart';

class Modem extends StatelessWidget {
  final ModemModel modem;

  const Modem({
    Key? key,
    required this.modem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      separatorBuilder: (_,__) => const SizedBox(height: 10),
      children: [
        Text(modem.opName),
        Text(modem.service ?? 'None'),
      ],
    );
  }
}
