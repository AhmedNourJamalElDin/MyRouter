import 'package:flutter/material.dart';

abstract class ColorGenerator {
  const ColorGenerator();

  Color generate(String text);
}
