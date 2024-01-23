import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String fieldOne = '';
  String fieldTwo = '';
  String fieldThree = '';
  String fieldFour = '';
  LoginBloc() : super(LoginInitial()) {
    String minute = '00';
    String hour = '00';
    on<CheckTimeEvent>((event, emit) {
      DateTime timeNow = DateTime.now();
      if (timeNow.hour < 10) {
         hour = '0${timeNow.hour}';
      } else {
         hour = timeNow.hour.toString();
      }
      if (timeNow.minute < 10) {
         minute = '0${timeNow.minute}';
      } else {
         minute = timeNow.minute.toString();
      }
      String fotmatedTimeNow = '$hour:$minute';
      String formatedInput = '$fieldOne$fieldTwo:$fieldThree$fieldFour';
      if (fotmatedTimeNow == formatedInput) {
        emit(LoginSuccess());
      } else {
        emit(LoginError());
      }
    });
  }
}
