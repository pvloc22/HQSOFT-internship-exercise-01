
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserInfoEvent{
  const UserInfoEvent();
}

class FetchUserInfo extends UserInfoEvent{
  String accessToken;
  FetchUserInfo(this.accessToken);
}