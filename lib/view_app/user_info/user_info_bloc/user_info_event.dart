
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserInfoEvent{
  const UserInfoEvent();
}

// ignore: must_be_immutable
class FetchUserInfo extends UserInfoEvent{
  String accessToken;
  FetchUserInfo(this.accessToken);
}