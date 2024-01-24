// // import 'package:awesome_notifications/awesome_notifications.dart';
// // import 'package:awesome_notifications/awesome_notifications_web.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // ignore: unused_import, depend_on_referenced_packages
// // import 'package:timezone/timezone.dart' as tz;
// // // ignore: unused_import, depend_on_referenced_packages
// // import 'package:timezone/data/latest.dart' as tz;

// // class NotificationService {
// //   static final NotificationService _notificationService =
// //       NotificationService._internal();

// //   factory NotificationService() {
// //     return _notificationService;
// //   }

// //   // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //   //     FlutterLocalNotificationsPlugin();

// //   // NotificationService._internal();

// //   // Future<void> initNotification() async {
// //   //   // Android initialization
// //   //   const AndroidInitializationSettings initializationSettingsAndroid =
// //   //       AndroidInitializationSettings('@mipmap/ic_launcher');

// //   //   // ios initialization

// //   //   const InitializationSettings initializationSettings =
// //   //       InitializationSettings(
// //   //     android: initializationSettingsAndroid,
// //   //   );
// //   //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   // }

// //   Future<void> showRecurringNotification({String? title, minute}) async {
// //     final int seconds = minute * 60;
// //     try {
// //       AwesomeNotifications().createNotification(
// //           schedule: NotificationInterval(interval: seconds),
// //           content: NotificationContent(
// //             id: DateTime.now().millisecond,
// //             channelKey: 'onetime_noti_channel',
// //             actionType: ActionType.Default,
// //             title: 'noti',
// //             body: title,
// //           ));
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

//   Future<void> showOneTimeNotification(
//       {int id = 1, String? title, String? body, hour, minut}) async {
//     try {
//       DateTime date = DateTime.now();
//       int dateDay = date.day;

//       if (hour < date.hour || (minut < date.minute && hour <= date.hour)) {
//         dateDay = dateDay + 1;
//       }

//       AwesomeNotifications().createNotification(
//           schedule:
//               NotificationCalendar(day: dateDay, hour: hour, minute: minut),
//           //schedule: NotificationInterval(interval: 60),
//           content: NotificationContent(
//             id: DateTime.now().millisecond,
//             channelKey: 'onetime_noti_channel',
//             actionType: ActionType.Default,
//             title: 'noti',
//             body: title,
//           ));
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: IOSInitializationSettings(),
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//   }

//   Future<void> showOneTimeNotification() async {
//     var androidDetails = AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       'channelDescription',
//       priority: Priority.high,
//       importance: Importance.max,
//     );

//     var iOSDetails = IOSNotificationDetails();

//     var platformChannelSpecifics =
//         NotificationDetails(android: androidDetails, iOS: iOSDetails);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'OneTime Notification',
//       'This is a one-time notification',
//       _nextInstanceOfTheHour(),
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//       payload: 'OneTimeNotification',
//     );
//   }

//   Future<void> showRecurringNotification() async {
//     var androidDetails = AndroidNotificationDetails(
//       'recurringChannelId',
//       'recurringChannelName',
//       'recurringChannelDescription',
//       priority: Priority.high,
//       importance: Importance.max,
//     );

//     var iOSDetails = IOSNotificationDetails();

//     var platformChannelSpecifics =
//         NotificationDetails(android: androidDetails, iOS: iOSDetails);

//     await flutterLocalNotificationsPlugin.periodicallyShow(
//       1,
//       'Recurring Notification',
//       'This is a recurring notification',
//       RepeatInterval.everyMinute,
//       platformChannelSpecifics,
//       payload: 'RecurringNotification',
//     );
//   }

//   Future<void> onSelectNotification(String payload) async {
//     // Handle notification selection here
//     print('Notification selected: $payload');
//   }

//   TZDateTime _nextInstanceOfTheHour() {
//     final now = TZDateTime.now(local);
//     return TZDateTime(
//       local,
//       now.year,
//       now.month,
//       now.day,
//       now.hour + 1,
//     );
//   }
// }
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
