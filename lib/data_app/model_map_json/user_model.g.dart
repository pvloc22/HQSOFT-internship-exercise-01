part of '../model/user_model.dart';



User _$UserFromJson(Map<String, dynamic> json){
  return User(
      username: json['userName'] as String?,
      address: json['address'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      tel: json['tel'] as String?,
      avatar: json['avatar'] as String?,
      roleID: json['roleID'] as String?,
      roleDesc: json['roleDesc'] as String?,
      distributorName: json['distributorName'] as String?);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'userName': instance.username ?? '',
  'address' :instance.address ?? '',
  'fullName': instance.fullName ?? '',
  'email': instance.email ?? '',
  'tel': instance.tel ?? '',
  'avatar': instance.avatar ?? '',
  'roleID': instance.roleID ?? '',
  'roleDesc': instance.roleDesc ?? '',
  'distributorName': instance.distributorName ?? '',
};