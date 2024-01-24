import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/domain/entity/recurring_noti.dart';

part 'recurring_noti_event.dart';
part 'recurring_noti_state.dart';

class RecurringNotiBloc extends Bloc<RecurringNotiEvent, RecurringNotiState> {
  RecurringNotiBloc() : super(RecurringNotiInitial()) {
    on<SaveRecurringNotiEvent>((event, emit) {
      recurringNotiBox.add(RecurringNoti(
        message: event.message,
        icon: event.icon,
        color: event.color,
        minute: event.minute,
      ));
    });
    on<DeleteRecurringNotiEvent>((event, emit) {
      recurringNotiBox.deleteAt(event.index);
    });
  }
}
