
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/notification_model.dart';

abstract class NotificationEvent {
  const NotificationEvent();
}

class FetchNotifications extends NotificationEvent{

}

class SwitchKindNotification extends NotificationEvent{
  final String typeNotification;
  final int indexSwitch;

  SwitchKindNotification({ required this.indexSwitch,required this.typeNotification});
}
class ReadNotification extends NotificationEvent{
  final NotificationModel notification;

  ReadNotification({required this.notification});


}
class RefreshNotification extends NotificationEvent{
  final int indexNotificationBeforeNavigator;

  RefreshNotification({required this.indexNotificationBeforeNavigator});
}
class LoadMoreNotification extends NotificationEvent{
  final int pageIndex;
  final int indexNotification;

  LoadMoreNotification({required this.pageIndex, required this.indexNotification});



}