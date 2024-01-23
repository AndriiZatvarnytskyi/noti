// ignore_for_file: deprecated_member_use

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/login_bloc/login_bloc.dart';
import 'package:noti/notification/notification.dart';
import 'package:noti/view/home_view/home_view.dart';
import 'package:noti/view/login_view/widgets/clock_widget.dart';
import 'package:noti/view/login_view/widgets/auth_time_form_picker.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isButtonEnabled = false;

  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  @override
  void initState() {
    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   if (!isAllowed) {
    //     // This is just a basic example. For real apps, you must show some
    //     // friendly dialog box before call the request method.
    //     // This is very important to not harm the user experience
    //     AwesomeNotifications().requestPermissionToSendNotifications();
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state == LoginSuccess()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(
                page: 0,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Log In',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 72.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Log In',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter current time in hh : mm format',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 42,
                ),
                const ClockWidget(),
                const SizedBox(
                  height: 42.0,
                ),
                AuthTimeFormPickerWidget(
                  checkEmpty: updateButtonState,
                  fieldOne: fieldOne,
                  fieldTwo: fieldTwo,
                  fieldThree: fieldThree,
                  fieldFour: fieldFour,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state == LoginError()) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xFFF3F3F4),
                        height: 48,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/icons/error_icon.png',
                              height: 20,
                              width: 20,
                              color: Theme.of(context).errorColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'The time is wrong. Try again.',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 34,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: ElevatedButton(
                    style: isButtonEnabled
                        ? const ButtonStyle()
                        : const ButtonStyle().copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).disabledColor)),
                    onPressed: () {
                      
                      context.read<LoginBloc>().add(CheckTimeEvent());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 56,
                      width: double.infinity,
                      child: Text(
                        'Confirm',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = fieldOne.text.isNotEmpty &&
          fieldTwo.text.isNotEmpty &&
          fieldThree.text.isNotEmpty &&
          fieldFour.text.isNotEmpty &&
          true;
    });
  }
}
