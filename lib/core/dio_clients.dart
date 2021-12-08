import 'dart:io';

import 'package:dio/dio.dart';
import 'package:router_setting/auth/services/auth.service.dart';

final unauthenticatedDioClient = createUnauthenticatedClient();
final authenticatedDioClient = createAuthenticatedClient();

Dio createUnauthenticatedClient() {
  final dio = Dio();

  dio.interceptors.add(UrlInterceptor());

  return dio;
}

Dio createAuthenticatedClient() {
  final dio = Dio();

  dio.interceptors.add(CookieInterceptor());
  dio.interceptors.add(UrlInterceptor());

  return dio;
}

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.cookieHeader] = AuthService.instance.cookie;
    options.headers['X-Requested-With'] = 'XMLHttpRequest';

    return super.onRequest(options, handler);
  }
}

class UrlInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AuthService.instance.baseUri != null) {
      options.baseUrl = AuthService.instance.baseUri!.toString();
    }

    return super.onRequest(options, handler);
  }
}
