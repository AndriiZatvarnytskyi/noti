import 'package:flutter/material.dart';
import 'package:noti/view/triger_view/widgets/check_box_widget.dart';
import 'package:noti/view/triger_view/widgets/triger_element_child_widget.dart';
import 'package:noti/view/triger_view/widgets/triget_elemet_widget.dart';
import 'package:noti/view/widgets/custom_app_bar.dart';

class TrigerView extends StatefulWidget {
  const TrigerView({super.key, required this.title});
  final String title;
  @override
  State<TrigerView> createState() => _TrigerViewState();
}

class _TrigerViewState extends State<TrigerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBarWidget(
          title: widget.title,
          needButton: true,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 204,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Trigers',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const CheckBoxWidget(),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: TrigerElementWidget(
                    title: 'Sport',
                    heightLine: widget.title == 'Select triger 1' ? 275 : 428,
                    isMain: true,
                    children: [
                      TrigerElementWidget(
                        heightLine: 0,
                        heightRow: widget.title == 'Select triger 1' ? 128 : 56,
                        title: widget.title == 'Select triger 1'
                            ? 'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.'
                            : 'Morning',
                        children: const [
                          TrigerElementChild(
                            title: '🚴 Biking',
                            isLast: false,
                          ),
                          TrigerElementChild(
                            title: '🏃 Running',
                            isLast: true,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color(0xffE6E6E6),
                        ),
                      ),
                      TrigerElementWidget(
                        heightLine: 10,
                        title: 'Evening',
                        children: [
                          widget.title == 'Select triger 1'
                              ? Container(
                                  height: 128,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16.0, left: 23),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    width: 1,
                                                    //height: isLast ? 28 : 56,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xffF3F3F4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 24.0),
                                                  child: SizedBox(
                                                    height: 20,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 8,
                                                            width: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xffE6E6E6),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Container(
                                                    height: 1,
                                                    width: 7,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffF3F3F4),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      100),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          100)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: 252,
                                                  child: Text(
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                    '🏓 Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                           
                                          ],
                                        ),
                                      ),
                                      const Positioned(
                                          right: 16,
                                          top: 16,
                                          child: CheckBoxWidget()),
                                    ],
                                  ),
                                )
                              : const TrigerElementChild(
                                  title: '🏓 Ping Pong',
                                  isLast: false,
                                ),
                          const TrigerElementChild(
                            title: '🏐 Volleyball',
                            isLast: true,
                          )
                        ],
                      ),
                      widget.title == 'Select triger 2'
                          ? Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Container(
                                height: 1,
                                width: double.infinity,
                                color: const Color(0xffE6E6E6),
                              ),
                            )
                          : const SizedBox(),
                      widget.title == 'Select triger 2'
                          ? TrigerElementWidget(
                              title: '🥊 Boxing',
                              heightLine: 100,
                              notNeedLine: true,
                            )
                          : const SizedBox(),
                      widget.title == 'Select triger 2'
                          ? Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 1,
                              width: double.infinity,
                              color: const Color(0xffF3F3F4),
                            )
                          : const SizedBox(),
                      widget.title == 'Select triger 2'
                          ? TrigerElementWidget(
                              title: '⚽ Football',
                              heightLine: 100,
                              notNeedLine: true,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: TrigerElementWidget(
                    title: 'Work',
                    heightLine: 89,
                    isMain: true,
                    children: [
                      TrigerElementWidget(
                        heightLine: 0,
                        title: '🗓️ Meeting',
                      ),
                      TrigerElementWidget(
                        heightLine: 0,
                        title: '🖨️ Print document',
                        notNeedLine: true,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '⏰ Alarm',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const CheckBoxWidget(),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🎉 Party',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const CheckBoxWidget(),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🍜 Dinner',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const CheckBoxWidget(),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE6E6E6),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 34, left: 16, right: 15, top: 16),
          height: 106,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 0.5,
                  blurRadius: 20,
                  offset: const Offset(0, -4), // changes position of shadow
                ),
              ]),
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: double.infinity,
                child: Text(
                  'Save',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
