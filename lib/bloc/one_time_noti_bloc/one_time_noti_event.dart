// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'one_time_noti_bloc.dart';

sealed class OneTimeNotiEvent extends Equatable {
  const OneTimeNotiEvent();

  @override
  List<Object> get props => [];
}

class SaveOneTimeNotiEvent extends OneTimeNotiEvent {
  final String message;
  final String hour;
  final String minute;
  final String? icon;
  final int? color;

  const SaveOneTimeNotiEvent(
      {required this.message,
      required this.hour,
      required this.minute,
       this.icon,
       this.color});

  @override
  List<Object> get props => [message, hour, minute, icon!, color!];
}

class DeleteOneTimeNotiEvent extends OneTimeNotiEvent {
  const DeleteOneTimeNotiEvent({
    required this.index,
  });

  final int index;
  @override
  List<Object> get props => [index];
}
