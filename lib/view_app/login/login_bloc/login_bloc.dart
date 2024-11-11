import 'package:esale_sfa_2023r1_framework_sample_basic/core/local_storage/base_preferences.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepo;

  LoginBloc(this._loginRepo) : super(const LoginInitial()) {
    on<LoginPress>(_loginCheck);
    on<LoginReset>(_loginReset);
  }

  void _loginCheck(LoginPress event, Emitter emit) async {
    try {
      String accessToken =
          await _loginRepo.loginAuthenticate(event.account, event.password);

      /// Save token to SharePreferences.
      await basePreferences.setTokenPreferred('token', accessToken);

      emit(LoginSuccessful(accessToken: accessToken));
    } catch (error) {
      emit(const LoginError());
    }
  }

  void _loginReset(LoginReset event, Emitter emit) {
    emit(const LoginInitial());
  }
}
