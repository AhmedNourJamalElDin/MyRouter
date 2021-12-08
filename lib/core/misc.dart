import 'package:loader_overlay/loader_overlay.dart';
import 'package:router_setting/main.dart';

void showLoader() {
  navigatorKey.currentContext!.loaderOverlay.show();
}

void hideLoader() {
  navigatorKey.currentContext!.loaderOverlay.hide();
}
