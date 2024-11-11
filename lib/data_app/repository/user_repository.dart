import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/user_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/remote/user_api_client.dart';

class UserRepository {
  final userApiClient = UserApiClient();

  Future<User> getUserInfo(String accessToken) async {
    return await userApiClient.fetchUserInfo(accessToken);
  }
}
