import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '../model_map_json/count_notification_model.dart';

@JsonSerializable()
class CountNotification extends Equatable{
  final int? totalAll;
  final int? totalTradePromotion;
  final int? totalOtherTrade;
  final int? totalNote;
  final int? totalOther;

  CountNotification({required this.totalAll, required this.totalTradePromotion, required this.totalOtherTrade, required this.totalNote, required this.totalOther});

  factory CountNotification.fromJson(Map<String, dynamic> json) => _$CountNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$CountNotificationToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}