import 'package:esale_sfa_2023r1_framework_sample_basic/core/local_storage/base_preferences.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/core/logic/factory_type_notification.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/count_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/manage_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/notification_responsitory.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState>{
  final NotificationRepository _notificationRepo;

  NotificationBloc(this._notificationRepo) : super(NotificationUninitialized()){
    on<FetchNotifications> (_loadedNotification);
    on<SwitchKindNotification> (_switchNotification);
    on<ReadNotification> (_readNotification);
    on<RefreshNotification> (_refreshNotification);
    on<LoadMoreNotification> (_loadMoreNotification);
  }

  void _loadedNotification(FetchNotifications event, Emitter emit) async {
    /// Return loading full screen state and delay 500 milliseconds
    emit(NotificationLoadingFullSplash());
    await Future.delayed(const Duration(milliseconds: 500));

    /// Get token from preference shares
    final String token = await basePreferences.getTokenPreferred('token');

    try{
      if(token.isNotEmpty){
        /// Fetch count notification and Fetch Notifications
        final CountNotification countNotification = await _notificationRepo.getCountNotification(token);
        final ManageNotification manageNotification = await _notificationRepo.getNotifications(token, '', 0);

        emit(NotificationInitialized(index: 0,manageNotification: manageNotification, countNotification: countNotification));
      }
      else{
        emit(NotificationError(message: "Token is empty."));
      }
    }
    catch(error){
      emit(NotificationError(message: "Error loading notification."));
      throw Exception('Error loading notification');
    }
  }

  void _switchNotification(SwitchKindNotification event, Emitter emit) async {
    /// Return loading body state and delay 500 milliseconds
    emit(NotificationLoadingBodySplash());
    await Future.delayed(const Duration(milliseconds: 500));

    final String token = await basePreferences.getTokenPreferred('token');
    try{
      final ManageNotification manageNotification = await _notificationRepo.getNotifications(token, event.typeNotification,0);

      emit(NotificationSwitched(manageNotification: manageNotification, index: event.indexSwitch));
    }
    catch(error){
      emit(NotificationError(message: "Error switch type of notification."));
      throw Exception("Error Switch type of notification.");
    }
  }
  void _readNotification(ReadNotification event, Emitter emit) async{
    final String token = await basePreferences.getTokenPreferred('token');

    try{
      final bool isReadNotification = await _notificationRepo.postReadNotification(token, event.notification);

      if(isReadNotification){
        emit(NotificationReadSuccess());
      }
      else{
        emit(NotificationError(message: 'Token is empty.'));
      }
    }
    catch(error){
      emit(NotificationError(message: 'Error read notification'));
      throw Exception("Error read notification");
    }
  }

  void _refreshNotification(RefreshNotification event, Emitter emit) async{
    /// Return loading full screen state and delay 500 milliseconds
    emit(NotificationLoadingFullSplash());
    await Future.delayed(const Duration(milliseconds: 500));

    /// Get token from preference shares -AND- Convert index to name of notification.
    final String token = await basePreferences.getTokenPreferred('token');
    final String nameTypeNotification = FactoryTypeNotification.getTypeNotification(event.indexNotificationBeforeNavigator);

    try{
      if(token.isNotEmpty){
        /// fetch count Notification and notifications
        final CountNotification countNotification = await _notificationRepo.getCountNotification(token);
        final ManageNotification manageNotification = await _notificationRepo.getNotifications(token, nameTypeNotification, 0);

        emit(NotificationInitialized(index: event.indexNotificationBeforeNavigator,manageNotification: manageNotification, countNotification: countNotification));
      }
      else{
        emit(NotificationError(message: "Token is empty."));
      }
    }
    catch(error){
      emit(NotificationError(message: "Error refresh notifications"));
      throw Exception('Error refresh notification');
    }
  }
  void _loadMoreNotification(LoadMoreNotification event, Emitter emit) async {
    /// Return loading more state and delay 500 milliseconds
    emit(NotificationLoadingMoreSplash());
    await Future.delayed(const Duration(milliseconds: 500));

    /// Get token -AND- Convert index to name of notification.
    final String token = await basePreferences.getTokenPreferred('token');
    String typeNotification = FactoryTypeNotification.getTypeNotification(event.indexNotification);

    try{
      final ManageNotification manageNotification = await _notificationRepo.getNotifications(token, typeNotification, event.pageIndex);

      if(manageNotification.notifications!.isNotEmpty){
        emit(NotificationLoadedMore(index: event.indexNotification, manageNotification: manageNotification));
      }
      else{
        emit(NotificationNotLoadedMore());
      }
    }catch(error){
      emit(NotificationError(message: 'Error load more notification'));
      throw Exception('Error load more notification.');
    }
  }
}

