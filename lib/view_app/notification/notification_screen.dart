import 'package:esale_sfa_2023r1_framework_sample_basic/data_app/repository/notification_responsitory.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_bloc.dart';
import 'package:esale_sfa_2023r1_framework_sample_basic/view_app/notification/notification_bloc/notification_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_bloc/notification_event.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (BuildContext context) => NotificationBloc(NotificationRepository())..add(FetchNotifications()),)
    ], child: const NotificationForm());
  }
}
