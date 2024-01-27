// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.isActive,
  });

  final void Function() onTap;
  final String text;
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(3),
          height: 40,
          width: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isActive
                ? Theme.of(context).primaryColor
                : Colors.white.withOpacity(0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: SvgPicture.asset(
                  icon,
                  height: 21,
                  width: 18,
                  color: isActive
                      ? Colors.white
                      : Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive
                        ? Colors.white
                        : Theme.of(context).appBarTheme.backgroundColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
