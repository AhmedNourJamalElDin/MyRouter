import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color? color;

  const Logo({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'data/router.png',
      width: 200,
      height: 200,
      color: color,
    );
  }
}
