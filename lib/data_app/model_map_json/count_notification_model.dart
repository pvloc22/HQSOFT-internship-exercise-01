part of '../model/count_notification_model.dart';

CountNotification _$CountNotificationFromJson(Map<String, dynamic> json){
  return CountNotification(
      totalAll: json['totalAll'],
      totalTradePromotion: json['totalTradePromotion'],
      totalOtherTrade: json['totalOtherTrade'],
      totalNote: json['totalNote'],
      totalOther: json['totalOther']);
}
Map<String, dynamic> _$CountNotificationToJson(CountNotification instance)=> <String, dynamic> {
  'totalAll': instance.totalAll ?? 0,
  'totalTradePromotion': instance.totalTradePromotion ?? 0,
  'totalOtherTrade': instance.totalOtherTrade ?? 0,
  'totalNote': instance.totalNote ?? 0,
  'totalOther': instance.totalOther ?? 0,
};