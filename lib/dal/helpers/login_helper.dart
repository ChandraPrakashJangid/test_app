import '../../model/login_response.dart';

class LoginHelper {

  static LoginResponse get loginResponse => LoginResponse(userName: "Chandra P Jangid", userEmail: "chandra@test.com");

  static LoginResponse get failedLoginResponse => LoginResponse(errorMessage: "Invalid credentials");

  LoginHelper._();

}
