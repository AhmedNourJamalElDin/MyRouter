import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/accounts/module.dart';
import 'package:router_setting/auth/screens/login.screen.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/core.module.dart';
import 'package:router_setting/core/screens/main.screen.dart';
import 'package:router_setting/core/services/module_booter.service.dart';
import 'package:router_setting/core/widgets/module_booter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModuleBooter(
      moduleBuilder: (bootProviderRegistrar, eventProviderRegistrar) async => [
        CoreModule(bootProviderRegistrar, eventProviderRegistrar),
        AccountsModule(bootProviderRegistrar, eventProviderRegistrar),
      ],
      child: GlobalLoaderOverlay(
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

              await modulesBooter.boot();
              print(modulesBooter.bootProviderRegistrar.providers);
              await modulesBooter.start();

              return AuthService.instance.isLoggedIn
                  ? MainScreen()
                  : LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}
