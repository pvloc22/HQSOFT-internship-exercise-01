import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/remote/login_api_client.dart';

class LoginRepository {
  final loginApiClient = LoginApiClient();

  Future<String> loginAuthenticate(String userName, String password) async {
    return await loginApiClient.loginAuthenticate(userName, password);
  }
}