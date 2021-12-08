import 'package:flutter/material.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/core/screens/main.screen.dart';
import 'package:router_setting/main.dart';

class NavigatorService {
  GlobalKey<NavigatorState> get key => navigatorKey;

  Future<void> replaceAllByLoginScreen() {
    return key.currentState!.pushAndRemoveUntil<void>(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  Future<void> replaceAllByMainScreen() {
    return key.currentState!.pushAndRemoveUntil<void>(
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => false,
    );
  }
}
