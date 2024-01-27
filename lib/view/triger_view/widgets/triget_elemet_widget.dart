// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/view/triger_view/widgets/check_box_widget.dart';

// ignore: must_be_immutable
class TrigerElementWidget extends StatefulWidget {
  List<Widget>? children;
  bool? notNeedLine;
  final String title;
  final double heightLine;
  double? heightRow;
  bool? isMain;
  bool? isLast;

  TrigerElementWidget(
      {this.children,
      required this.title,
      this.isMain,
      this.isLast,
      this.notNeedLine,
      this.heightRow,
      required this.heightLine,
      super.key});

  @override
  State<TrigerElementWidget> createState() => _TrigerElementWidgetState();
}

class _TrigerElementWidgetState extends State<TrigerElementWidget> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.children != null &&
                widget.children!.isNotEmpty &&
                (widget.isMain == null || !widget.isMain!)
            ? Positioned(
                top: 25,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
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
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        widget.isMain != null && widget.isMain!
            ? Positioned(
                left: 12,
                top: 56,
                child: Container(
                  height: widget.heightLine > 0
                      ? widget.heightLine
                      : 0,
                  width: 1,
                  decoration: const BoxDecoration(
                    color: Color(0xffF3F3F4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ),
              )
            : const SizedBox(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: widget.children != null &&
                          widget.children!.isNotEmpty &&
                          (widget.isMain == null || !widget.isMain!)
                      ? 25.0
                      : 0,
                  right: 16),
              height: widget.heightRow != null ? widget.heightRow! : 56,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                    widget.children == null || widget.children!.isEmpty
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  widget.children != null && widget.children!.isNotEmpty
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isOpen = !isOpen;
                                });
                              },
                              child: isOpen
                                  ? SvgPicture.asset(
                                      'assets/svg/expand_less_icon.svg',
                                      height: 24,
                                      width: 24,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : SvgPicture.asset(
                                      'assets/svg/expand_more_icon.svg',
                                      height: 24,
                                      width: 24,
                                      color: Theme.of(context).primaryColor,
                                    ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  widget.children == null || widget.children!.isEmpty
                      ? Row(
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(100),
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
                        ],
                      )
                      : const SizedBox(),
                  SizedBox(
                    width: 247,
                    child: Text(
                      widget.title,
                      softWrap: true,
                      maxLines: 4,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: widget.children != null &&
                                  widget.children!.isNotEmpty
                              ? FontWeight.w700
                              : FontWeight.w400),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const CheckBoxWidget(),
                ],
              ),
            ),
            widget.notNeedLine == null || !widget.notNeedLine!
                ? Padding(
                    padding: EdgeInsets.only(
                      left: widget.children != null &&
                              widget.children!.isNotEmpty &&
                              widget.isMain != null &&
                              widget.isMain!
                          ? 37.0
                          : widget.children != null &&
                                  widget.children!.isNotEmpty
                              ? 58.0
                              : 30.0,
                    ),
                    child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffF3F3F4)),
                  )
                : const SizedBox(),
            widget.children != null && isOpen
                ? Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: SizedBox(
                      child: Column(
                        children: widget.children!,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
