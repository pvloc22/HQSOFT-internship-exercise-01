
import 'package:equatable/equatable.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/count_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/manage_notification_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class NotificationState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationUninitialized extends NotificationState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationInitialized extends NotificationState{
  final int index;
  final ManageNotification manageNotification;
  final CountNotification countNotification;

  NotificationInitialized({required this.index,required this.manageNotification, required this.countNotification});


  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationSwitched extends NotificationState{
  final int index;
  final ManageNotification manageNotification;


  NotificationSwitched({required this.index, required this.manageNotification});

  @override
  List<Object> get props => [];
}

class NotificationLoadingBodySplash extends NotificationState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationLoadingFullSplash extends NotificationState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationLoadingMoreSplash extends NotificationState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationLoadedMore extends NotificationState{
  final int index;
  final ManageNotification manageNotification;


  NotificationLoadedMore({required this.index, required this.manageNotification});

  @override
  List<Object> get props => [];
}

class NotificationNotLoadedMore extends NotificationState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotificationReadSuccess extends NotificationState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotificationError extends NotificationState{
  final String message;

  NotificationError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}