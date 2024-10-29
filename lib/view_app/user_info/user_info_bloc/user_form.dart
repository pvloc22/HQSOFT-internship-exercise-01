import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_bloc.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatefulWidget {
  final String accessToken;

  const UserForm({super.key, required this.accessToken});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  void initState(){
    super.initState();
    context.read<UserInfoBloc>().add( FetchUserInfo(widget.accessToken));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen"),),
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if(state is UserInfoLoad){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is UserInfoFetchSuccessful){
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height*1/4,
                width: MediaQuery.of(context).size.width*3/4,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text('Information ${state.userInfo.username}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                      Text('FullName: ${state.userInfo.fullName}'),
                      Text('Address: ${state.userInfo.address}'),
                      Text('Email: ${state.userInfo.email}'),
                      Text('Telephone number: ${state.userInfo.tel}'),
                      Text('Avatar: ${state.userInfo.avatar}'),
                      Text('Role Id: ${state.userInfo.roleID}'),
                      Text('Role Desc: ${state.userInfo.roleDesc}'),
                      Text('Distributor Name: ${state.userInfo.distributorName}'),
                    ],
                  ),
                ),
              ),
            );
          }
          else if(state is UserInfoFetchError){
            return const Center(
              child: Text('Error fetch information of user.'),
            );
          }
          else {
            return const Center(
              child: Text('Initial information'),
            );
          }
        },
      )
    );
  }
}
