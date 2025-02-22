import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/dal/helpers/login_helper.dart';
import 'http_client/http_client.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';
import "package:mockito/annotations.dart";

@GenerateMocks(<Type>[HttpClient])
class HttpRepository {
  @protected
  late HttpClient client;

  @protected
  late Dio dio;

  HttpRepository({String baseUrl = "https://baseapi.com/api"}) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    client = HttpClient(dio, baseUrl: baseUrl);
  }

  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    Future.delayed(Duration(seconds: 2));
    // return client.login(loginRequest);
    if (loginRequest.email == "test@test.com" &&
        loginRequest.password == "123456") {
      return LoginHelper.loginResponse;
    }
    return LoginHelper.failedLoginResponse;
  }

  Future<void> forgotPassword({required String email}) async {
    return client.forgotPassword({'email': email});
  }
}
