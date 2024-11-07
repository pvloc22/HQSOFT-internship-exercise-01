import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/user_repository.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_form.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UserInfoBloc(UserRepository()),
    child: UserForm(),);
  }
}
