import 'package:flutter/material.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/core/screens/main.screen.dart';
import 'package:router_setting/home/screens/home.dart';
import 'package:router_setting/main.dart';

class NavigatorService {
  Future<void> replaceAllByLoginScreen() {
    return navigatorKey.currentState!.pushAndRemoveUntil<void>(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  Future<void> replaceAllByMainScreen() {
    return navigatorKey.currentState!.pushAndRemoveUntil<void>(
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => false,
    );
  }
}
