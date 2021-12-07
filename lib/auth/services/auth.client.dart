import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.client.g.dart';

@RestApi(baseUrl: "http://192.168.0.1/")
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/login.cgi")
  @FormUrlEncoded()
  Future<HttpResponse> login({
    @Field() required String uname,
    @Field() required String passwd,
  });

  @POST("/login.cgi")
  Future<HttpResponse> logout(@Field() String logout);

  @GET("/data.ria?token=1")
  Future<int> authId();
}
