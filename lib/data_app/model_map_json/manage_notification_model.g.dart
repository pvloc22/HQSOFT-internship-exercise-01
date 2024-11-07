// import '../model/notification_model.dart';

part of '../model/manage_notification_model.dart';

ManageNotification _$ManageNotificationFromJson(Map<String, dynamic> json){
  return ManageNotification(
      total: json['total'],
      notifications: (json['data'] as List).map((element)=> NotificationModel.fromJson(element)).toList()
  );
}
Map<String, dynamic> _$ManageNotificationToJson (ManageNotification instance) => <String, dynamic>{
  'total' : instance.total ?? 0,
  'data' : (instance.notifications ?? []).map((element) => element.toJson()).toList()
};