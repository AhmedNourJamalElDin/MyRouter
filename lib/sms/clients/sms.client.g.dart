// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SmsClient implements SmsClient {
  _SmsClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SmsRequestModel> getInbox(index) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'index': index};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SmsRequestModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/data.ria?CfgType=sms_action&cont=inbox',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SmsRequestModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SmsRequestModel> getDraft(index) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'index': index};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SmsRequestModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/data.ria?CfgType=sms_action&cont=draft',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SmsRequestModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SmsSetupModel> getSetup() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SmsSetupModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/data.ria?FileID=10&sect_name=SMSC',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SmsSetupModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> deleteMessage(authID, tag,
      {CfgType = "sms_action", type = "inbox", cmd = "del"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'authID': authID,
      'tag': tag,
      'CfgType': CfgType,
      'type': type,
      'cmd': cmd
    };
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/webpost.cgi',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
