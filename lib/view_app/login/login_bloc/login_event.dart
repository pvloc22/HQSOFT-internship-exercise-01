import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginReset extends LoginEvent {
  const LoginReset();
}

class LoginPress extends LoginEvent {
  final String account;
  final String password;

  const LoginPress({required this.account, required this.password});
}
