

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data_app/model/user_model.dart';

@immutable
abstract class UserInfoState extends Equatable{

  @override
  List<Object> get props => [];
}
class UserInfoInitial extends UserInfoState{

  @override
  List<Object> get props => [];
}
class UserInfoLoad extends UserInfoState{

  @override
  List<Object> get props => [];
}

class UserInfoFetchSuccessful extends UserInfoState{
  final User userInfo;

  UserInfoFetchSuccessful({required this.userInfo});

  @override
  List<Object> get props => [];
}
class UserInfoFetchError extends UserInfoState{

  @override
  List<Object> get props => [];
}