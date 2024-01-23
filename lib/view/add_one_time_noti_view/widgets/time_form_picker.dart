import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/login_bloc/login_bloc.dart';

class TimeFormPickerWidget extends StatefulWidget {
  const TimeFormPickerWidget(
      {Key? key,
      required this.fieldOne,
      required this.fieldTwo,
      required this.fieldThree,
      required this.fieldFour,
      required this.checkEmpty})
      : super(key: key);
  final TextEditingController fieldOne;
  final TextEditingController fieldTwo;
  final TextEditingController fieldThree;
  final TextEditingController fieldFour;
  final Function checkEmpty;
  @override
  State<TimeFormPickerWidget> createState() => _TimeFormPickerWidgetState();
}

class _TimeFormPickerWidgetState extends State<TimeFormPickerWidget> {
  String? resultTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TimeInput(widget.fieldOne, 0, widget.checkEmpty), // auto focus
        TimeInput(widget.fieldTwo, 1, widget.checkEmpty),
        const SizedBox(
          width: 7,
        ),
        Text(
          ':',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFFB9B9B9),
              ),
        ),
        const SizedBox(
          width: 7,
        ),
        TimeInput(widget.fieldThree, 2, widget.checkEmpty),
        TimeInput(widget.fieldFour, 3, widget.checkEmpty),
      ],
    );
  }
}

// Create an input widget that takes only one digit
class TimeInput extends StatelessWidget {
  final Function checkEmpty;
  final TextEditingController controller;
  final int index;
  const TimeInput(this.controller, this.index, this.checkEmpty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.0, left: index != 0 ? 6.0 : 0.0),
      child: Container(
        alignment: Alignment.center,
        width: 44.0,
        height: 48.0,
        child: TextField(
          textAlign: TextAlign.center,
          autofocus: false,
          maxLength: 1,
          controller: controller,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Theme.of(context).textTheme.titleSmall!.color,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (index == 0) {
              context.read<LoginBloc>().fieldOne = controller.text;
            } else if (index == 1) {
              context.read<LoginBloc>().fieldTwo = controller.text;
            }
            if (index == 2) {
              context.read<LoginBloc>().fieldThree = controller.text;
            }
            if (index == 3) {
              context.read<LoginBloc>().fieldFour = controller.text;
            }
            checkEmpty();
          },
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.all(0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
