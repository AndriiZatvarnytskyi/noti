import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({required this.title, this.needButton, super.key});
  final String title;
  final bool? needButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 64),
      height: 98,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 0.5,
          blurRadius: 4,
          offset: const Offset(0, 0.5), // changes position of shadow
        ),
      ], color: const Color(0xff1A1717)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          needButton != null && needButton!
              ? Positioned(
                  left: 16,
                  bottom: 10,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/svg/arrow_back_ios_icon.svg',
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )))
              : const SizedBox()
        ],
      ),
    );
  }
}
