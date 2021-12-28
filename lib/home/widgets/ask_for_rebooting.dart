import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

class AskForRebooting extends StatelessWidget {
  final VoidCallback onReboot;
  final VoidCallback onDismiss;

  const AskForRebooting({
    Key? key,
    required this.onReboot,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: SeparatedColumn(
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        children: [
          Text(
            "The router is offline",
            style: Theme.of(context).textTheme.headline5,
          ),
          const Text("Do you want to reboot it?"),
          SeparatedRow(
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onDismiss,
                  child: const Text("Dismiss"),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: onReboot,
                  child: const Text("Reboot Now"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
