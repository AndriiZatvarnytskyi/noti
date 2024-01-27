import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: const Color(0xffE6E6E6),
          ),
        ),
        child: isSelected
            ? SvgPicture.asset(
                'assets/svg/check.svg',
                height: 16,
                width: 16,
                // ignore: deprecated_member_use
                color: Colors.white,
              )
            : Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF3F3F4),
                    borderRadius: BorderRadius.circular(100)),
              ),
      ),
    );
  }
}
