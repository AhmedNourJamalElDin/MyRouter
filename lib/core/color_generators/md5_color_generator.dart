import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:router_setting/core/color_generators/color_generator.dart';

class Md5ColorGenerator extends ColorGenerator {
  const Md5ColorGenerator();

  @override
  Color generate(String text) {
    final hashString =
        md5.convert(utf8.encode(text)).toString().substring(0, 6);

    return HexColor(hashString);
  }
}
