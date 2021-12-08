import 'dart:ui';

import 'package:flutter/material.dart';

class ClickToReveal extends StatefulWidget {
  final Widget child;

  const ClickToReveal({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _ClickToRevealState createState() => _ClickToRevealState();
}

class _ClickToRevealState extends State<ClickToReveal> {
  var isRevealed = false;

  @override
  Widget build(BuildContext context) {
    if (isRevealed) {
      return widget.child;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Text("HIDDEN"),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                isRevealed = true;
                setState(() {});
              },
              icon: Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      ),
    );
  }
}
