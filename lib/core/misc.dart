import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/home/screens/home.dart';
import 'package:router_setting/main.dart';

void showLoader() {
  navigatorKey.currentContext!.loaderOverlay.show();
}

void hideLoader() {
  navigatorKey.currentContext!.loaderOverlay.hide();
}
