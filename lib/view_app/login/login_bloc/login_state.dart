import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState{
  const LoginInitial();

  @override
  List<Object> get props =>[];
}
class LoginSuccessful extends LoginState{
  final String message;

  const LoginSuccessful({required this.message});

  @override
  List<Object> get props=> [];
}
class LoginError extends LoginState{
  final bool isAccount;
  final bool isPassword;

  const LoginError({required this.isAccount, required this.isPassword});


  List<Object> get prop => [];
}