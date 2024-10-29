import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/user_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/user_repository.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>{
  final UserRepository _userRepo;

  UserInfoBloc(this._userRepo) : super( UserInfoInitial()){
    on<FetchUserInfo>  (_userInfoLoad);
  }

  void _userInfoLoad(FetchUserInfo event, Emitter emit) async{
    emit(UserInfoLoad());
    try{
      User userInfo = await _userRepo.getUserInfo(event.accessToken);
      emit(UserInfoFetchSuccessful(userInfo: userInfo));
    }
    catch(error){
      emit(UserInfoFetchError());
    }
  }
}