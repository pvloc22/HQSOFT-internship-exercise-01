

import 'dart:convert';

import 'package:esale_sfa_2023r1_framework_sample_basic/core/logic/parse_date.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/count_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/manage_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/url_api/notification_url.dart';

import 'package:http/http.dart' as http;

class NotificationApiClient {
  Future<ManageNotification> fetchNotifications(String token, String typeNotification, int pageIndex) async {

    final url = '${API_NOTIFICATION_URL.GET_NOTIFICATIONS}'
        '?fromDate=11/01/2024'
        '&toDate=11/01/2024'
        '&langID=vi'
        '&pageIndex=$pageIndex'
        '&pageSize=10'
        '&type=$typeNotification';

    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);

        return ManageNotification.fromJson(data);
      }
      throw Exception(
          'Failed to fetch notifications with state response: ${response.statusCode} ');
    }
    catch (error) {
      // print('Error fetch data user info: $error');
      throw Exception('Error fetch notifications info');
    }
  }

  Future<CountNotification> fetchCountNotification(String token) async {

    final url ='${API_NOTIFICATION_URL.GET_COUNT_NOTIFICATION}'
    '?fromDate=11/01/2024'
        '&toDate=11/04/2024'
        '&langID=vi';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);;

        return CountNotification.fromJson(data);
      }
      throw Exception(
          'Failed to fetch count notification with state response: ${response.statusCode} ');
    }
    catch (error) {
      throw Exception('Error fetch count notification.');
    }
  }

  Future<bool> readNotification(String token,  NotificationModel notification)async {
    final url = API_NOTIFICATION_URL.POST_READ_NOTIFICATION;
    final uri = Uri.parse(url);

    final body = jsonEncode({
      "branchID": "",
      "slsperID": "S14",
      "notifyID": "${notification.notifyID}",
      "notifyTime": ParseDate.parseDateStandard((notification.notifyTime) as String),
      "notifyType": "${notification.notifyType}"
    });
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    try {
      var response = await http.post(uri, headers: headers, body:  body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("${jsonDecode(response.body)}");
        return jsonDecode(response.body);
      }
      throw Exception(
          'Failed to read notification with state response: ${response.statusCode} ');
    }
    catch (error) {
      // print('Error fetch data user info: $error');
      throw Exception('Error fetch count notification.');
    }
  }
}