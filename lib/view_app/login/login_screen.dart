
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc/login_bloc.dart';
import 'login_bloc/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(LoginRepository()),
      child: const LoginForm(),
    );
  }
}

