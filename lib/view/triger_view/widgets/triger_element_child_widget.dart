import 'package:flutter/material.dart';
import 'package:noti/view/triger_view/widgets/check_box_widget.dart';

class TrigerElementChild extends StatefulWidget {
  const TrigerElementChild(
      {required this.isLast, required this.title, super.key});
  final bool isLast;
  final String title;

  @override
  State<TrigerElementChild> createState() => _TrigerElementChildState();
}

class _TrigerElementChildState extends State<TrigerElementChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 1,
                        height: widget.isLast ? 28 : 56,
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F3F4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffE6E6E6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xffF3F3F4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const Expanded(child: SizedBox()),
                const CheckBoxWidget(),
              ],
            ),
          ),
          widget.isLast
              ? Padding(
                  padding: const EdgeInsets.only(left: 52.0),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xffF3F3F4),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
