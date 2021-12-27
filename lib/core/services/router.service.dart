import 'dart:async';

import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/dio_clients.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/misc.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/home/clients/router_client.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:router_setting/home/utils.dart';
import 'package:rxdart/rxdart.dart';

class RouterService {
  static RouterService get instance => getIt<RouterService>();

  final dynDataSubject = BehaviorSubject<DynUpdateModel?>();
  var shouldAskForReboot = false;

  Future<void> dispose() async {
    dynDataSubject.close();
  }

  Future<void> reboot() async {
    showLoader();

    try {
      await AuthService.instance.fetchAuthId();
    } catch (e) {
      hideLoader();
      rethrow;
    }

    try {
      await RouterClient(authenticatedDioClient)
          .reboot("${AuthService.instance.authId}");

      dynDataSubject.value = null;

      hideLoader();
      await DialogService().success("Successfully rebooted!");
      await AuthService.instance.cleanCookies();
    } catch (e) {
      hideLoader();
      DialogService().error(
        "Failed to reboot:",
        subtitle: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> dynUpdate() async {
    try {
      final data = await RouterClient(authenticatedDioClient).dynUpdate();
      dynDataSubject.add(data);

      if(shouldAskForReboot && isOffline(data.signal.modem)) {
        askForRebooting();
      }
    } catch (e) {
      dynDataSubject.add(null);
      DialogService().error(
        "Failed to fetch data",
        subtitle: e.toString(),
      );
    }
  }

  Future<void> askForRebooting() async {
    final result = await DialogService().confirmation(
      "You are offline!",
      subtitle: "Do you want to restart the router?",
    );

    shouldAskForReboot = true;

    if (result == false) {
      return;
    }

    await reboot();
  }
}
