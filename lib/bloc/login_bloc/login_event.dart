part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CheckTimeEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class AddInput extends LoginEvent {
  const AddInput({
    required this.timeNow,
  });
  final String timeNow;

  @override
  List<Object> get props => [timeNow];
}
