import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/login_bloc/login_bloc.dart';

class AuthTimeFormPickerWidget extends StatefulWidget {
  const AuthTimeFormPickerWidget({
    Key? key,
    required this.fieldOne,
    required this.fieldTwo,
    required this.fieldThree,
    required this.fieldFour,
    required this.checkEmpty,
  }) : super(key: key);

  final TextEditingController fieldOne;
  final TextEditingController fieldTwo;
  final TextEditingController fieldThree;
  final TextEditingController fieldFour;
  final Function checkEmpty;

  @override
  State<AuthTimeFormPickerWidget> createState() =>
      _AuthTimeFormPickerWidgetState();
}

class _AuthTimeFormPickerWidgetState extends State<AuthTimeFormPickerWidget> {
  String? resultTime;

  final FocusNode focusNodeOne = FocusNode();
  final FocusNode focusNodeTwo = FocusNode();
  final FocusNode focusNodeThree = FocusNode();
  final FocusNode focusNodeFour = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeInput(
            widget.fieldOne, 0, widget.checkEmpty, focusNodeOne), // auto focus
        TimeInput(widget.fieldTwo, 1, widget.checkEmpty, focusNodeTwo),
        const SizedBox(
          width: 7,
        ),
        Text(
          ':',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 32,
                color: const Color(0xFFB9B9B9),
              ),
        ),
        const SizedBox(
          width: 7,
        ),
        TimeInput(widget.fieldThree, 2, widget.checkEmpty, focusNodeThree),
        TimeInput(widget.fieldFour, 3, widget.checkEmpty, focusNodeFour)
      ],
    );
  }
}

class TimeInput extends StatefulWidget {
  final Function checkEmpty;
  final TextEditingController controller;
  final FocusNode focusNode;
  final int index;
  const TimeInput(this.controller, this.index, this.checkEmpty, this.focusNode,
      {Key? key})
      : super(key: key);

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  int backCount = 0;
  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        RawKeyboard.instance.addListener(_handleKey);
      } else {
        RawKeyboard.instance.removeListener(_handleKey);
      }
    });
  }

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (widget.controller.text.isEmpty) {
        widget.focusNode.previousFocus();
        backCount = 0;
      } else {
        backCount = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        alignment: Alignment.center,
        width: 44.0,
        height: 48.0,
        child: TextField(
          textAlign: TextAlign.center,
          autofocus: false,
          maxLength: 1,
          focusNode: widget.focusNode,
          controller: widget.controller,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Theme.of(context).textTheme.titleSmall!.color,
          onEditingComplete: () {
            widget.focusNode.nextFocus();
          },
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }

            if (widget.index == 0) {
              context.read<LoginBloc>().fieldOne = widget.controller.text;
            } else if (widget.index == 1) {
              context.read<LoginBloc>().fieldTwo = widget.controller.text;
            }
            if (widget.index == 2) {
              context.read<LoginBloc>().fieldThree = widget.controller.text;
            }
            if (widget.index == 3) {
              context.read<LoginBloc>().fieldFour = widget.controller.text;
            }
            widget.checkEmpty();
          },
          decoration: const InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }
}
