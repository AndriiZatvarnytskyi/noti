//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:noti/bloc/login_bloc/login_bloc.dart';
import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/bloc/recurring_noti_bloc/recurring_noti_bloc.dart';
import 'package:noti/const/theme_data.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/domain/entity/one_time_noti.dart';
import 'package:noti/domain/entity/recurring_noti.dart';
import 'package:noti/notification/notification.dart';
import 'package:noti/view/login_view/login_view.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await Hive.initFlutter();
  tz.initializeTimeZones();
  await NotificationService().initNotification();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'onetime_noti_channel_group',
        channelKey: 'onetime_noti_channel',
        channelName: 'One time notifications',
        channelDescription: 'Notification channel for one time noti',
      ),
      NotificationChannel(
        channelGroupKey: 'recurring_noti_channel_group',
        channelKey: 'recurring_noti_channel',
        channelName: 'Recurring notifications',
        channelDescription: 'Notification channel for recurring noti',
      )
    ],
  );
  Hive.registerAdapter(OneTimeNotiAdapter());
  Hive.registerAdapter(RecurringNotiAdapter());
  oneTimeNotiBox = await Hive.openBox<OneTimeNoti>('oneTimeNotiBox');
  recurringNotiBox = await Hive.openBox<RecurringNoti>('recurringNotiBox');
  initializeDateFormatting().then((_) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecurringNotiBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => OneTimeNotiBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          home: const LoginView()),
    );
  }
}
