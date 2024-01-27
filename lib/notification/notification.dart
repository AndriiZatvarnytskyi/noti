import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti/notification/notification_controller.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
// ignore: unused_import, depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  Future<void> initNotification() async {
    bool isAllowedToSendNotification =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowedToSendNotification) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  Future<void> showRecurringNotification({String? title, minute}) async {
    final int seconds = minute * 60;
    try {
      AwesomeNotifications().createNotification(
          schedule: NotificationInterval(interval: seconds),
          content: NotificationContent(
            id: DateTime.now().millisecond,
            channelKey: 'recurring_noti_channel',
            actionType: ActionType.Default,
            title: 'noti',
            body: title,
          ));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> showOneTimeNotification(
      {String? title,
      String? body,
      hour,
      minut,
      required BuildContext context}) async {
    try {
      DateTime date = DateTime.now();
      int dateDay = date.day;

      if (hour < date.hour || (minut < date.minute && hour <= date.hour)) {
        dateDay = dateDay + 1;
      }

      AwesomeNotifications().createNotification(
          schedule:
              NotificationCalendar(day: dateDay, hour: hour, minute: minut),
          content: NotificationContent(
            id: DateTime.now().millisecond,
            channelKey: 'onetime_noti_channel',
            actionType: ActionType.Default,
            title: 'noti',
            body: title,
          ));
      AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationDisplayedMethod: NotificationController(context: context)
            .onNotificationDisplayedMethod,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
