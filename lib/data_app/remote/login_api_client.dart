import 'dart:convert';

import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/url_api/login_url.dart';
import 'package:http/http.dart' as http;

class LoginApiClient {
  Future<String> loginAuthenticate(String userName, String password) async{
    final url = Uri.parse(API_LOGIN_URL.POST_AUTHENTICATE);
    try{
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'userName': userName,
            'password': password,
          }
        )
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final data = jsonDecode(response.body);
        return data['access_token'];
      }
      else{
        throw Exception('Wrong account or password');
      }
    }
    catch(error){
      print('Error login failed');
      throw Exception('Failed login');
    }
  }
}