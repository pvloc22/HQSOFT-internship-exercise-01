import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/count_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/manage_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/remote/notification_api_client.dart';

class NotificationRepository{
  final notificationApiClient = NotificationApiClient();

  Future<ManageNotification> getNotifications(String token, String typeNotification, int pageIndex) async{
    return await notificationApiClient.fetchNotifications(token, typeNotification, pageIndex);
  }
  Future<CountNotification> getCountNotification(String token) async{
    return await notificationApiClient.fetchCountNotification(token);
  }

  Future<bool> postReadNotification(String token, NotificationModel notification) async{
    return await notificationApiClient.readNotification(token, notification);
  }

}