import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/registration.dart';
import 'package:router_setting/core/screens/main.screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            await initRegistrationModule();

            return AuthService.instance.isLoggedIn
                ? const MainScreen()
                : const LoginScreen();
          },
        ),
      ),
    );
  }
}
