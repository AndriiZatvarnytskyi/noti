import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/domain/boxes.dart';

class NotificationController {
  final BuildContext context;

  NotificationController({required this.context});

  @pragma("vm:entry-point")
  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
   if(receivedNotification.channelKey == 'onetime_noti_channel') {
    List notiList = oneTimeNotiBox.values.toList();
      int notiIndex = notiList.indexWhere(
          (element) => element.message == receivedNotification.body);

      context
          .read<OneTimeNotiBloc>()
          .add(DeleteOneTimeNotiEvent(index: notiIndex));
   }
    
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}
}
