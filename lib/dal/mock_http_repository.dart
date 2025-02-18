import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../model/login_response.dart';
import 'http_repository.dart';

// import 'mock_http_repository.mocks.dart' as internal_mock;
import 'mock_http_repository.mocks.dart' as internal_mock;

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<HttpRepository>(as: #HttpRepositoryInternal),
  ],
)
class MockHttpRepository extends internal_mock.HttpRepositoryInternal {
  MockHttpRepository() {
    // when(login(any, any)).thenAnswer((_) async {
    //   return LoginResponse(
    //     email: "test@example.com",
    //     token: "dummyToken", userName: '',
    //   );
    // });
    // when(forgotPassword(any)).thenAnswer((_) async => Future.value());
  }
}
