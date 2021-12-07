import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:router_setting/home/models/dyn_update.model.dart';

part 'router_client.g.dart';

@RestApi(baseUrl: "http://192.168.0.1/")
abstract class RouterClient {
  factory RouterClient(Dio dio, {String baseUrl}) = _RouterClient;

  @POST("/webpost.cgi")
  Future<HttpResponse> reboot(
    @Field() String authID, {
    @Field() String CfgType = "reboot_reset",
    @Field() String cmd = "reboot",
  });

  @GET('/data.ria?DynUpdate=up_5s')
  Future<DynUpdateModel> dynUpdate();
}
