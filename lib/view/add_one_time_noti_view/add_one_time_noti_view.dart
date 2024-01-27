// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/const/select_icon_and_color_lists.dart';
import 'package:noti/notification/notification.dart';
import 'package:noti/view/add_one_time_noti_view/widgets/time_form_picker.dart';
import 'package:noti/view/home_view/home_view.dart';
import 'package:noti/view/widgets/custom_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddOneTimeNotiView extends StatefulWidget {
  const AddOneTimeNotiView({super.key});

  @override
  State<AddOneTimeNotiView> createState() => _AddOneTimeNotiViewState();
}

class _AddOneTimeNotiViewState extends State<AddOneTimeNotiView> {
  final icons = selectIcons;
  final colors = selectColors;
  bool isButtonEnabled = false;
  int? selectedIcon;
  int? selectedColor;
  int? notiIcon;
  int? notiColor;

  final PanelController panelController = PanelController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomAppBarWidget(
              title: 'Add new notificaiton',
              needButton: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Message',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 120,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.left,
                      autofocus: false,
                      controller: messageController,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).appBarTheme.backgroundColor),
                      maxLines: 10,
                      cursorColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      onChanged: (value) {
                        updateButtonState();
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: const Color(0xFFB9B9B9)),
                        hintText: 'Enter message',
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Type time',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TimeFormPickerWidget(
                      checkEmpty: updateButtonState,
                      fieldOne: fieldOne,
                      fieldTwo: fieldTwo,
                      fieldThree: fieldThree,
                      fieldFour: fieldFour),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Icon',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(19),
                          decoration: BoxDecoration(
                              color: notiColor != null
                                  ? Color(selectColors[notiColor!])
                                  : Colors.white,
                              border: Border.all(
                                  width: 1, color: const Color(0xFFB9B9B9)),
                              borderRadius: BorderRadius.circular(100)),
                          child: notiIcon != null
                              ? SvgPicture.asset(
                                  selectIcons[notiIcon!],
                                  width: 36,
                                  height: 36,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SvgPicture.asset(
                                    'assets/svg/empty_photo.svg',
                                    color: const Color(0xFFB9B9B9),
                                    width: 36,
                                    height: 36,
                                  ),
                                )),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 158,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Select icon",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0, left: 16, right: 16),
              child: ElevatedButton(
                style: isButtonEnabled
                    ? const ButtonStyle()
                    : const ButtonStyle().copyWith(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).disabledColor)),
                onPressed: () {
                  checkRightTime();
                  if (isButtonEnabled) {
                    context.read<OneTimeNotiBloc>().add(SaveOneTimeNotiEvent(
                          message: messageController.text,
                          hour: '${fieldOne.text}${fieldTwo.text}',
                          minute: '${fieldThree.text}${fieldFour.text}',
                          color: notiColor != null
                              ? selectColors[notiColor!]
                              : null,
                          icon:
                              notiIcon != null ? selectIcons[notiIcon!] : null,
                        ));
                    NotificationService().showOneTimeNotification(
                        context: context,
                        title: messageController.text,
                        hour: int.parse('${fieldOne.text}${fieldTwo.text}'),
                        minut:
                            int.parse('${fieldThree.text}${fieldFour.text}'));
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
          ]),
          SlidingUpPanel(
            padding: const EdgeInsets.all(16),
            controller: panelController,
            maxHeight: 473,
            minHeight: 0,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Icon style',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    panelController.close();
                  },
                  child: SvgPicture.asset(
                    'assets/svg/cancel_circle_icon.svg',
                    color: Theme.of(context).primaryColor,
                    width: 25.0,
                    height: 25.0,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Theme.of(context).hintColor,
              ),
            ),
            Text(
              'Background colors',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color(0xFF747377), fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _colorBox(
                      colors[0],
                      0,
                    ),
                    _colorBox(
                      colors[1],
                      1,
                    ),
                    _colorBox(
                      colors[2],
                      2,
                    ),
                    _colorBox(
                      colors[3],
                      3,
                    ),
                    _colorBox(
                      colors[4],
                      4,
                    ),
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Select icons',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xFF747377),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 11,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _iconBox(
                      icons[0],
                      0,
                    ),
                    _iconBox(
                      icons[1],
                      1,
                    ),
                    _iconBox(
                      icons[2],
                      2,
                    ),
                    _iconBox(
                      icons[3],
                      3,
                    ),
                    _iconBox(
                      icons[4],
                      4,
                    ),
                  ],
                )),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                if (selectedColor != null) {
                  notiColor = selectedColor;
                }
                if (selectedIcon != null) {
                  notiIcon = selectedIcon;
                }
                setState(() {});
                panelController.close();
              },
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: double.infinity,
                child: Text(
                  'Save changes',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 52,
            )
          ],
        ));
  }

  _iconBox(String icon, int index) {
    return InkWell(
      onTap: () {
        selectedIcon = index;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        decoration: selectedIcon == index
            ? BoxDecoration(
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(100))
            : const BoxDecoration(),
        child: Container(
            padding: const EdgeInsets.all(9),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffE6E6E6)),
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(icon)),
      ),
    );
  }

  _colorBox(int color, int index) {
    return InkWell(
      onTap: () {
        selectedColor = index;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        decoration: selectedColor == index
            ? BoxDecoration(
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(100))
            : const BoxDecoration(),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Color(color),
              border: Border.all(width: 1, color: const Color(0xffE6E6E6)),
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }

  void checkRightTime() {
    if (fieldOne.text.isNotEmpty &&
        fieldTwo.text.isNotEmpty &&
        fieldThree.text.isNotEmpty &&
        fieldFour.text.isNotEmpty) {
      if ((int.parse(fieldOne.text + fieldTwo.text) > 23) ||
          (int.parse(fieldThree.text + fieldTwo.text) > 59)) {}
    }
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = messageController.text.isNotEmpty &&
          fieldOne.text.isNotEmpty &&
          fieldTwo.text.isNotEmpty &&
          fieldThree.text.isNotEmpty &&
          fieldFour.text.isNotEmpty &&
          int.parse(fieldOne.text + fieldTwo.text) < 24 &&
          int.parse(fieldOne.text + fieldTwo.text) >= 00 &&
          int.parse(fieldThree.text + fieldTwo.text) < 60 &&
          int.parse(fieldThree.text + fieldTwo.text) >= 00 &&
          true;
    });
  }
}
