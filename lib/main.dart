import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/registration.dart';
import 'package:router_setting/core/screens/main.screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          splash: 'assets/router.png',
          splashIconSize: 200,
          screenFunction: () async {
            await initRegistrationModule();

            return AuthService.instance.isLoggedIn
                ? const MainScreen()
                : const LoginScreen();
          },
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 800,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              // ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5),
            ),
        ),
        initialRoute: "/",
      ),
    );
  }
}
