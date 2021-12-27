import 'dart:async';
import 'dart:io';

import 'package:modular/modular.dart';
import 'package:retrofit/dio.dart';
import 'package:router_setting/auth/events.dart';
import 'package:router_setting/auth/services/auth.client.dart';
import 'package:router_setting/auth/services/md5_hash.dart';
import 'package:router_setting/core/dio_clients.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/misc.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/core/services/navigator.service.dart';
import 'package:router_setting/core/services/router_url_parser.dart';

class AuthService {
  static AuthService get instance => getIt<AuthService>();

  static const qSessId = 'qSessId';
  Uri? baseUri;
  int? authId;
  String? setCookie;
  Map<String, String>? parsedHeaders;

  Future<void> dispose() async {
    if (isLoggedIn) {
      await logout();
    }
  }

  String get cookie =>
      "$qSessId=$sessionId; DWRLOGGEDID=$sessionId; DWRLOGGEDUSER=admin; DWRLOGGEDTIMEOUT=179";

  String get sessionId => parsedHeaders![qSessId]!;

  Future<void> login(
    String url,
    String username,
    String password,
  ) async {
    showLoader();

    try {
      final uri = RouterUrlParser().parse(url);
      final resp =
          await AuthClient(unauthenticatedDioClient, baseUrl: uri.toString())
              .login(
        uname: username,
        passwd: Md5Hash().hash(password),
      );

      if (resp.response.statusCode != 200) {
        DialogService().error("Failed to login");
        return;
      }

      baseUri = uri;

      event(
        LoggedInEvent(
          url: url,
          username: username,
          password: password,
        ),
      );

      updateAuthCredentials(resp);
      NavigatorService().replaceAllByMainScreen();
    } catch (e) {
      DialogService().error(e.toString());
      return;
    } finally {
      hideLoader();
    }
  }

  Future<void> logout() async {
    showLoader();

    try {
      final resp = await AuthClient(authenticatedDioClient).logout(sessionId);

      if (resp.response.statusCode != 200) {
        DialogService().error("Failed to logout");
        return;
      }

      cleanCookies();
    } catch (e) {
      DialogService().error(e.toString());
    } finally {
      hideLoader();
    }
  }

  void updateAuthCredentials(HttpResponse<dynamic> resp) {
    setCookie = resp.response.headers.value(HttpHeaders.setCookieHeader);
    var list = setCookie!.split(';').map((e) => e.split('='));

    parsedHeaders = {
      for (var v in list) v[0]: v[1],
    };
  }

  bool get isLoggedIn => setCookie != null;

  Future<void> cleanCookies() {
    baseUri = null;
    setCookie = null;
    authId = null;
    parsedHeaders = null;
    return NavigatorService().replaceAllByLoginScreen();
  }

  Future<void> fetchAuthId() async {
    try {
      authId = await AuthClient(authenticatedDioClient).authId();
    } catch (e) {
      DialogService().error(
        "Failed to fetch AuthId",
        subtitle: e.toString(),
      );
      rethrow;
    }
  }
}
