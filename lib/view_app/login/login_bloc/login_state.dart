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
  final String accessToken;

  const LoginSuccessful({required this.accessToken});

  @override
  List<Object> get props=> [];
}
class LoginError extends LoginState{
  const LoginError();


  List<Object> get prop => [];
}