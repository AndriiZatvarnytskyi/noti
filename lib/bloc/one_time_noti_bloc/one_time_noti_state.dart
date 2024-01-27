part of 'one_time_noti_bloc.dart';

sealed class OneTimeNotiState extends Equatable {
  const OneTimeNotiState();
  
  @override
  List<Object> get props => [];
}

final class OneTimeNotiInitial extends OneTimeNotiState {}

final class OneTimeNotiDelete extends OneTimeNotiState {}

final class OneTimeNotiError extends OneTimeNotiState {}
