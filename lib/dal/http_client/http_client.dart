// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/login_request.dart';
import '../../model/login_response.dart';

part 'http_client.g.dart';

@RestApi(baseUrl: "https://baseapi.com/api")
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @POST("/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("/forgot_password")
  Future<void> forgotPassword(@Body() Map<String, dynamic> body);
}
