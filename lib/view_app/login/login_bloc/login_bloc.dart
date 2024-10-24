
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(): super(const LoginInitial()) {
    on<LoginPress> (_loginCheck);
    on<LoginReset> (_loginReset);

  }

  void _loginCheck (LoginPress event, Emitter emit){
    bool isAccount = false;
    bool isPassword = false;

    if(event.account == "loc")
      isAccount = true;
    if(event.password == "12345")
      isPassword = true;

    if(isAccount && isPassword) {
      emit(const LoginSuccessful(message: "Login successful"));
    }
    else {
      emit( LoginError(isAccount: isAccount, isPassword: isPassword));
    }
  }
  void _loginReset(LoginReset event, Emitter emit){
    emit(const LoginInitial());
  }
}