import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:router_setting/sms/models/setup.model.dart';
import 'package:router_setting/sms/models/sms.model.dart';

part 'sms.client.g.dart';

@RestApi(baseUrl: "http://192.168.0.1/")
abstract class SmsClient {
  factory SmsClient(Dio dio, {String baseUrl}) = _SmsClient;

  @GET('/data.ria?CfgType=sms_action&cont=inbox')
  Future<SmsRequestModel> getInbox(@Query('index') int index);

  @GET('/data.ria?CfgType=sms_action&cont=draft')
  Future<SmsRequestModel> getDraft(@Query('index') int index);

  @GET('/data.ria?FileID=10&sect_name=SMSC')
  Future<SmsSetupModel> getSetup();
}
