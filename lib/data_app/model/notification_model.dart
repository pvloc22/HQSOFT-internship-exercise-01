import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '../model_map_json/notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends Equatable{
  final String? notifyID;
  final String? title;
  final String? content;
  final String? notifyTime;
  final String? fileType;
  final String? fileUrl;
  final String? notifyType;
  final String? fileModifiedDate;
  final String? viewDate;
  final bool? isRead;
  final bool? isSync;
  final String? fromdate;
  final String? toDate;
  final String? code;

  NotificationModel({required this.notifyID, required this.title, required this.content, required this.notifyTime, required this.fileType, required this.fileUrl, required this.notifyType, required this.fileModifiedDate, required this.viewDate, required this.isRead, required this.isSync, required this.fromdate, required this.toDate, required this.code});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson()=> _$NotificationToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}