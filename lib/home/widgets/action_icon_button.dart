import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final String tooltipMessage;
  final VoidCallback onPressed;

  const ActionIconButton({
    required this.tooltipMessage,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.deepOrange,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
