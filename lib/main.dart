import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/screens/main.screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Router!',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoaderOverlay(
        child: AuthService.instance.isLoggedIn ? MainScreen() : LoginScreen(),
        overlayOpacity: 0.4,
        overlayColor: Colors.blueGrey,
      ),
    );
  }
}
