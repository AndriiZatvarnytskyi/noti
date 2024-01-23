import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/domain/entity/one_time_noti.dart';

part 'one_time_noti_event.dart';
part 'one_time_noti_state.dart';

class OneTimeNotiBloc extends Bloc<OneTimeNotiEvent, OneTimeNotiState> {
  OneTimeNotiBloc() : super(OneTimeNotiInitial()) {
    on<OneTimeNotiEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SaveOneTimeNotiEvent>((event, emit) {
      if (int.parse(event.hour) > 23 || int.parse(event.minute) > 59) {
        return;
      } else {
        oneTimeNotiBox.add(OneTimeNoti(
          message: event.message,
          notificationHour: event.hour,
          notificationMinute: event.minute,
          icon: event.icon,
          color: event.color,
        ));
      }
    });
    on<DeleteOneTimeNotiEvent>((event, emit) {
      oneTimeNotiBox.deleteAt(event.index);
    });
  }
}
