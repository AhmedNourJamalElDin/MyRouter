import 'package:injectable/injectable.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/services/router.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  @singleton
  AuthService authService(SharedPreferences prefs) => AuthService();

  @singleton
  RouterService get routerService => RouterService();
}
