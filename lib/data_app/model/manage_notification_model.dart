import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/notification_model.dart';
import 'package:json_annotation/json_annotation.dart';

part '../model_map_json/manage_notification_model.g.dart';

@JsonSerializable()
class ManageNotification{
  final int? total;
  final List<NotificationModel>? notifications;

  ManageNotification({
    this.total = 0,
    this.notifications = const [],
  });
  ManageNotification.withRequired({
    required this.total,
    required this.notifications,
  });

  factory ManageNotification.fromJson(Map<String, dynamic> json) => _$ManageNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$ManageNotificationToJson(this);

  void addMoreNotifications(List<NotificationModel> newNotifications) {
    notifications!.addAll(newNotifications);  // Append new notifications
  }
}