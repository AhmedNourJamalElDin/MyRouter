import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class ClientNumber extends StatelessWidget {
  final int number;

  const ClientNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      children: [
        const Icon(
          Icons.group,
          color: Colors.blue,
        ),
        Text(number.toString()),
      ],
    );
  }
}
