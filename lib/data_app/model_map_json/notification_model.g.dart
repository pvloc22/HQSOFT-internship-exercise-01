part of '../model/notification_model.dart';

NotificationModel _$NotificationFromJson(Map<String, dynamic> json) {
  return NotificationModel(
      notifyID: json['notifyID'],
      title: json['title'],
      content: json['content'],
      notifyTime: json['notifyTime'],
      fileType: json['fileType'],
      fileUrl: json['fileUrl'],
      notifyType: json['notifyType'],
      fileModifiedDate: json['fileModifiedDate'],
      viewDate: json['viewDate'],
      isRead: json['isRead'],
      isSync: json['isSync'],
      fromdate: json['fromdate'],
      toDate: json['toDate'],
      code: json['code']);
}

Map<String, dynamic> _$NotificationToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notifyID': instance.notifyID ?? '',
      'title': instance.title ?? '',
      'content': instance.content ?? '',
      'notifyTime': instance.notifyTime ?? '',
      'fileType': instance.fileType ?? '',
      'fileUrl': instance.fileUrl ?? '',
      'notifyType': instance.notifyType ?? '',
      'fileModifiedDate': instance.fileModifiedDate ?? '',
      'viewDate': instance.viewDate ?? '',
      'isRead': instance.isRead ?? false,
      'isSync': instance.isSync ?? false,
      'fromdate': instance.fromdate ?? '',
      'toDate': instance.toDate ?? '',
      'code': instance.code ?? '',
    };
