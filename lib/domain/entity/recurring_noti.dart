// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'recurring_noti.g.dart';

@HiveType(typeId: 2)
class RecurringNoti {
  RecurringNoti({
    required this.message,
    required this.minute,
    required this.icon,
    required this.color,
  });

  @HiveField(0)
  String message;

  @HiveField(1)
  int minute;

  @HiveField(2)
  String? icon;

  @HiveField(3)
  int? color;
}
