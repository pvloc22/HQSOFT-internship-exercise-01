import 'package:esale_sfa_2023r1_framework_sample_basic/core/local_storage/base_preferences.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_screen.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_bloc.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/user_info/user_info_bloc/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserForm extends StatefulWidget {

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late final String _token;
  @override
  void initState(){
    super.initState();
    _initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const NotificationScreen();
                }));
              },
              icon: const Icon(Icons.notifications,size: 30,))
        ],
      ),
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

  Future<void> _initialize() async{
    ///Get token from SharedPreferences
    _token = await basePreferences.getTokenPreferred('token');

    /// Call event fetch all information of user.
    context.read<UserInfoBloc>().add(FetchUserInfo(_token));
  }
}
