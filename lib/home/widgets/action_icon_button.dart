import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final String tooltipMessage;
  final IconData icon;
  final VoidCallback onPressed;

  const ActionIconButton({
    required this.tooltipMessage,
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.deepOrange,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
