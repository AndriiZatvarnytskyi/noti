// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'one_time_noti.g.dart';

@HiveType(typeId: 1)
class OneTimeNoti {

  OneTimeNoti({
    required this.message,
    required this.notificationHour,
    required this.notificationMinute,
    required this.icon,
    required this.color,
  });

  @HiveField(0)
  String message;

  @HiveField(1)
  String notificationHour;

  @HiveField(2)
  String notificationMinute;

  @HiveField(3)
  String? icon;

  @HiveField(4)
  int? color;
  
}
