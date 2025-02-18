import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/login_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://baseapi.com/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<LoginRequest> login(@Body() Map<String, dynamic> body);

  @POST("/forgot_password")
  Future<void> forgotPassword(@Body() Map<String, dynamic> body);
}