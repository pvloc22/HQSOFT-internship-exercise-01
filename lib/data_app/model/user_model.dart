import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part '../model_map_json/user_model.g.dart';

@JsonSerializable()
class User extends Equatable{
  final String? username;
  final String? address;
  final String? fullName;
  final String? email;
  final String? tel;
  final String? avatar;
  final String? roleID;
  final String? roleDesc;
  final String? distributorName;

  User({
    required this.username,
    required this.address,
    required this.fullName,
    required this.email,
    required this.tel,
    required this.avatar,
    required this.roleID,
    required this.roleDesc,
    required this.distributorName,
});

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson()=> _$UserToJson(this);
  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  String toString() => 'User {username: $username, address: $address, fullName: $fullName, email: $email, tel: $tel, avatar: $avatar, roleID: $roleID, roleDesc: $roleDesc, distributorName:$distributorName';
}
