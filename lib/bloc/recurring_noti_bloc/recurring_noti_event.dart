part of 'recurring_noti_bloc.dart';

sealed class RecurringNotiEvent extends Equatable {
  const RecurringNotiEvent();

  @override
  List<Object> get props => [];
}

class SaveRecurringNotiEvent extends RecurringNotiEvent {
  final String message;
  final int minute;
  final String? icon;
  final int? color;

  const SaveRecurringNotiEvent(
      {required this.message, required this.minute, this.icon, this.color});

  @override
  List<Object> get props => [message, minute, icon!, color!];
}

class DeleteRecurringNotiEvent extends RecurringNotiEvent {
  const DeleteRecurringNotiEvent({
    required this.index,
  });

  final int index;
  @override
  List<Object> get props => [index];
}
