import 'dart:async';

import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/dio_clients.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/misc.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/home/clients/router_client.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';
import 'package:rxdart/rxdart.dart';

class RouterService {
  static RouterService get instance => getIt<RouterService>();

  final dynDataSubject = BehaviorSubject<DynUpdateModel?>();
  final shouldAskForRebootingSubject = BehaviorSubject<bool>();

  Stream<DynUpdateModel?> get dynDataStream => dynDataSubject.stream;

  Stream<bool> get shouldAskForRebootingStream =>
      shouldAskForRebootingSubject.stream;

  RouterService() {
    shouldAskForRebootingSubject.add(true);
  }

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
    } catch (e) {
      dynDataSubject.add(null);
      DialogService().error(
        "Failed to fetch data",
        subtitle: e.toString(),
      );
    }
  }
}
