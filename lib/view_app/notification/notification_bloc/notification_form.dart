import 'package:esale_sfa_2023r1_framework_sample_basic/core/logic/logic.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/core/view_components/base_appbar.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/manage_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_bloc.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../detail_notification_screen.dart';

class NotificationForm extends StatefulWidget {
  const NotificationForm({super.key});

  @override
  State<NotificationForm> createState() => _NotificationFormState();
}

class _NotificationFormState extends State<NotificationForm>  {

  final Map<int, ScrollController> _scrollControllers = {};
  final Map<int, int> _pageIndexes = {};

  late ManageNotification _manageNotification = ManageNotification();
  int index = 0;


  @override
  void initState() {
    // _manageNotification = ManageNotification();
    for (int i = 0; i < 5; i++) {
      _scrollControllers[i] = ScrollController()..addListener(() => _scrollListener(i));
      _pageIndexes[i] = 0;
    }

    super.initState();
  }
  @override
  void dispose() {
    _scrollControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppbar(),
      body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: const Color(0xFFF7F7F8),
          margin: const EdgeInsets.only(top: 12),
          child: BlocListener<NotificationBloc, NotificationState> (
              listener:(context, state){
                if(state is NotificationLoadingFullSplash){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return const Center(child: CircularProgressIndicator());
                      });
                }
                else if(state is NotificationInitialized){
                  setState(() {
                    _manageNotification = state.manageNotification;
                    index = state.index;
                    _pageIndexes[index] = 0;
                  });
                  Navigator.of(context, rootNavigator: true).pop();
                }
                else if(state is NotificationSwitched){
                  setState(() {
                    _manageNotification = state.manageNotification;
                    index = state.index;
                    _pageIndexes[index] = 0;
                  });
                }
                else if(state is NotificationLoadedMore){
                  setState(() {
                    _manageNotification.addMoreNotifications(state.manageNotification.notifications ?? []);
                    index = state.index;
                  });
                }
              },
              child: BlocBuilder<NotificationBloc, NotificationState>
                (builder: (context, state) {
                  if(state is NotificationLoadingBodySplash){
                  return const Center(child: CircularProgressIndicator());
                }
                  else if(state is NotificationError){
                    return const Center(child: Text('Error'),);
                  }
                else {
                    return _bodyNotification(_manageNotification,index, state);
                  }
              }),
          )

      ),
    );
  }

  Widget _bodyNotification(ManageNotification manageNotification, int currentTypeNotification, NotificationState state){

    if(manageNotification.notifications!.isEmpty){
      if(state is NotificationLoadingFullSplash)
        return SizedBox();
      return const Center(
        child: Text("Empty!"),
      );
    }
    else{
      return ListView.builder(
        controller: _scrollControllers[currentTypeNotification],
          itemCount: manageNotification.notifications!.length +((state is NotificationLoadingMoreSplash) ? 1 : 0) ,
          itemBuilder: (BuildContext context, index) {
          if(index < manageNotification.notifications!.length){
            if(manageNotification.notifications![index].notifyType == 'AUTOPROMO'){
              return _itemNotification(FontAwesomeIcons.gift, Colors.red,manageNotification.notifications![index], currentTypeNotification);
            }
            else if(manageNotification.notifications![index].notifyType == 'DISPLAY'){
              return _itemNotification(FontAwesomeIcons.building, const Color(0xFF5757FE),manageNotification.notifications![index], currentTypeNotification);
            }
            else if(manageNotification.notifications![index].notifyType == 'ACCUMULATE'){
              return _itemNotification(FontAwesomeIcons.handHoldingDollar, const Color(0xFFEF3793),manageNotification.notifications![index], currentTypeNotification);
            }
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
          return null;
          });;
    }
  }

  void _scrollListener(int indexNotification) {
    if (_scrollControllers[indexNotification]!.position.pixels == _scrollControllers[indexNotification]!.position.maxScrollExtent) {
      int a = _manageNotification.notifications!.length;
      if(a < (_manageNotification.total ?? 0)){
        _pageIndexes[indexNotification] = _pageIndexes[indexNotification]! + 1;
        context.read<NotificationBloc>().add(LoadMoreNotification(pageIndex: _pageIndexes[indexNotification]!, indexNotification: indexNotification));
        print(_pageIndexes[indexNotification]);
      }
    }
  }


  Widget _itemNotification(IconData icon, Color color,NotificationModel notification, int currentTypeNotification){

    return  GestureDetector(
      onTap: (){
        if(!(notification.isRead)!){
          context.read<NotificationBloc>().add(ReadNotification(notification: notification,));
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailNotificationScreen(title: notification.title as String, fromDate: notification.fromdate as String, toDate: notification.toDate as String,);
          })).then((value){
            context.read<NotificationBloc>().add(RefreshNotification(indexNotificationBeforeNavigator: currentTypeNotification));
          });
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailNotificationScreen(title: notification.title as String, fromDate: notification.fromdate as String, toDate: notification.toDate as String,);
          }));
        }

      },
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 12),
        child: Card(
          child: Container(
            padding:const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
            ),
            child: Row(
              children: [
                _iconNotification(icon, color),
                _contentItemNotification(notification.title as String, notification.fromdate as String, notification.toDate as String, notification.isRead as bool)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconNotification(IconData iconNotification, Color backgroundColor){
    return Container(
      height: 45,
      width: 45,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Center(child: FaIcon(iconNotification, color: Colors.white,)),
    );
  }
  Widget _contentItemNotification(String title,String startDate, String endDate, bool isRead){
    return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontSize: 14,  fontWeight: FontWeight.bold),)),
              isRead
                  ? const SizedBox()
                  :Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.red.withOpacity(0.2),
                          width: 4
                      ),
                    ),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color(0xFFD92332),
                          width: 4
                      ),
                    ),

                  )
                ],
              )
            ],
          ),
          Text("Từ ngày ${ParseDate.getDMY(startDate)} - ${ParseDate.getDMY(endDate)}", style: const TextStyle(fontSize: 12, color: Color(0xFFA4A4A8)),)
        ],
      ),
    );
  }
}

