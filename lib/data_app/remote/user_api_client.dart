import 'dart:convert';

import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/url_api/user_url.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
  Future<User> fetchUserInfo(String accessToken) async {
    final url = Uri.parse(API_USER_URL.GET_USER_INFO);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $accessToken",
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user info: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetch data user info: $error');
      throw Exception('Error fetch user info');
    }
  }
}
