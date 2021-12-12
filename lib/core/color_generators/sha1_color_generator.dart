import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:router_setting/core/color_generators/color_generator.dart';

class Sha1ColorGenerator extends ColorGenerator {
  const Sha1ColorGenerator();

  Color generate(String text) {
    final hashString =
        sha1.convert(utf8.encode(text)).toString().substring(0, 6);

    return HexColor(hashString);
  }
}
