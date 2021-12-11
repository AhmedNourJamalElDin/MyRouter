import 'package:event_bus/event_bus.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/main.dart';

void showLoader() {
  navigatorKey.currentContext!.loaderOverlay.show();
}

void hideLoader() {
  navigatorKey.currentContext!.loaderOverlay.hide();
}

void event(dynamic event) {
  getIt<EventBus>().fire(event);
}
