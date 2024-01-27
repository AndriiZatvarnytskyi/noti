// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noti/bloc/login_bloc/login_bloc.dart';
import 'package:noti/view/home_view/home_view.dart';
import 'package:noti/view/login_view/widgets/auth_time_form_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noti/view/widgets/custom_app_bar.dart';

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
  late String _timeString;
  late Timer _timer;
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
  _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
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
        // appBar: AppBar(
        //   title: const Text(
        //     'Log In',
        //   ),
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        //           spreadRadius: 0.5,
        //           blurRadius: 4,
        //           offset: Offset(0, 0.5), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        body: Center(
          child: Column(
            children: [
              const CustomAppBarWidget(title: 'Log In'),
              const SizedBox(
                height: 72,
              ),
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
                height: 48.0,
              ),
              Center(
                child: Text(
                  _timeString,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
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
                      color: const Color(0xffF3F3F4),
                      height: 48,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 18,
                          ),
                          SvgPicture.asset(
                            'assets/svg/error.svg',
                            height: 20,
                            width: 20,
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
                    if(isButtonEnabled) {
                      _timer.cancel();
                    }
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
