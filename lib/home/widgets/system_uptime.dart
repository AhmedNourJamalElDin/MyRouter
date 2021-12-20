import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class SystemUptime extends StatelessWidget {
  final int milliseconds;

  const SystemUptime({
    Key? key,
    required this.milliseconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      children: [
        const Icon(
          Icons.lock_clock_sharp,
          color: Colors.blue,
        ),
        Text(milliseconds.toString()),
      ],
    );
  }
}
