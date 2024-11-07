// ignore_for_file: unused_import

import 'package:esale_sfa_2023r1_framework_sample_basic/core/logic/factory_type_notification.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/model/count_notification_model.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_bloc.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_event.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBottomAppbar extends StatefulWidget implements PreferredSizeWidget{
  const BaseBottomAppbar({super.key});



  @override
  State<BaseBottomAppbar> createState() => _BaseBottomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BaseBottomAppbarState extends State<BaseBottomAppbar> {

  int index = 0;
  CountNotification? countNotification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocListener<NotificationBloc, NotificationState> (
          listener: (context, state){
            if(state is NotificationInitialized ){
              setState(() {
                countNotification  = state.countNotification;
              });
            }
          },
          child: Row(
            children: [
              _kindNotification("Tất cả", (countNotification?.totalAll ?? 0), 0, index),
              _kindNotification("Trade khuyến mãi",  (countNotification?.totalTradePromotion ?? 0), 1, index),
              _kindNotification("CT Trade khác",  (countNotification?.totalOtherTrade ?? 0), 2, index),
              _kindNotification("Ghi chú",  (countNotification?.totalNote ?? 0), 3, index),
              _kindNotification("Khác",  (countNotification?.totalOther ?? 0), 4, index),
            ],
          ),
        )
      )
    );
  }
  Widget _kindNotification(String typeNotification, int quantityNotification, int indexNotification, int currentIndexNotification){
    bool isCurrent = (currentIndexNotification == indexNotification);
    return GestureDetector(
      onTap: (){
        setState(() {
          index = indexNotification;
        });
        String typeNotification = FactoryTypeNotification.getTypeNotification(indexNotification);
        context.read<NotificationBloc>().add(SwitchKindNotification(indexSwitch: indexNotification,typeNotification: typeNotification));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: isCurrent ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
                width: 1
              )
            ),
            child: Text("$typeNotification", style:  TextStyle(color: isCurrent? Colors.black : Colors.white ),),
          ),
          quantityNotification == 0
              ? const SizedBox()
              : Positioned(
            right: 0,
            top: -12,
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD92332)
              ),
              child: Text("$quantityNotification", style: const TextStyle(color: Colors.white, fontSize: 10),),
            ),
          )
        ],
      ),
    );
  }
}
