// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:test_app/model/login_response.dart';
import 'package:test_app/model/login_request.dart';
import 'http_client/http_client.dart';
import "package:mockito/annotations.dart";

@GenerateMocks(<Type>[
  HttpClient
])
class HttpRepository {
  final HttpClient _httpClient;

  HttpRepository({HttpClient? httpClient})
      : _httpClient = httpClient ?? HttpClient(Dio());

  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    return (await _httpClient.login(loginRequest));
  }

  Future<void> forgotPassword(String email) async {
    return await _httpClient.forgotPassword({
      'email': email,
    });
  }
}
