import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/services/router.service.dart';

@module
abstract class RegisterModule {
  @singleton
  AuthService get authService => AuthService();

  @singleton
  RouterService get routerService => RouterService();

  @singleton
  EventBus get eventBus => EventBus();
}
