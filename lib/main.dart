import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/boot.dart';
import 'package:router_setting/core/event_listener.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/screens/main.screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final eventBus = EventBus();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayOpacity: 0.4,
      overlayColor: Colors.blueGrey,
      child: MaterialApp(
        title: 'My Router!',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: AnimatedSplashScreen.withScreenFunction(
          splash: 'data/router.png',
          splashIconSize: 200,
          screenFunction: () async {
            await boot();

            return AuthService.instance.isLoggedIn ? MainScreen() : LoginScreen();
          },
        ),
      ),
    );
  }
}
