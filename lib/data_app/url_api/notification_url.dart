import 'package:esale_sfa_2023r1_framework_sample_basic/data_base/url_api/root_url.dart';

const String ROOT_API_NOTIFICATION_URL = ROOT_API_URL;

class API_NOTIFICATION_URL {
  static String GET_NOTIFICATIONS =
      '$ROOT_API_NOTIFICATION_URL/Notification/FetchNotification';
  static String GET_COUNT_NOTIFICATION =
      '$ROOT_API_NOTIFICATION_URL/Notification/FetchCountNotification';
  static String POST_READ_NOTIFICATION =
      '$ROOT_API_NOTIFICATION_URL/Notification/ReadNotification';
}
