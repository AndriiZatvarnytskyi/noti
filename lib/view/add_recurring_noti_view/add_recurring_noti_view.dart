// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/recurring_noti_bloc/recurring_noti_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/const/select_icon_and_color_lists.dart';
import 'package:noti/notification/notification.dart';
import 'package:noti/view/add_one_time_noti_view/widgets/time_form_picker.dart';
import 'package:noti/view/home_view/home_view.dart';

class AddRecurringNotiView extends StatefulWidget {
  final int minute;
  const AddRecurringNotiView({
    Key? key,
    required this.minute,
  }) : super(key: key);

  @override
  State<AddRecurringNotiView> createState() => _AddRecurringNotiViewState();
}

class _AddRecurringNotiViewState extends State<AddRecurringNotiView> {
  final icons = selectIcons;
  final colors = selectColors;
  bool isButtonEnabled = false;
  int? selectedIcon;
  int? selectedColor;

  final PanelController panelController = PanelController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/arrow_back_ios_icon.png',
            color: Colors.white,
          ),
        ),
        title: Text('Add new notificaiton'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
              ),
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
                  textAlign: TextAlign.left,
                  autofocus: false,
                  controller: messageController,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).appBarTheme.backgroundColor),
                  maxLines: 10,
                  cursorColor: Theme.of(context).appBarTheme.backgroundColor,
                  onChanged: (value) {
                    updateButtonState();
                  },
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    hintText: 'Enter message',
                    counterText: '',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFE6E6E6)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
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
                    decoration: BoxDecoration(
                        color: selectedColor != null
                            ? Color(selectColors[selectedColor!])
                            : Colors.white,
                        border: Border.all(
                            width: 1, color: const Color(0xFFB9B9B9)),
                        borderRadius: BorderRadius.circular(100)),
                    child: selectedIcon != null
                        ? Image.asset(
                            selectIcons[selectedIcon!],
                          )
                        : Image.asset(
                            'assets/icons/gallery.png',
                            color: const Color(0xFFB9B9B9),
                            width: 50,
                            height: 50,
                          ),
                  ),
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
                            width: 1, color: Theme.of(context).primaryColor),
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
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: ElevatedButton(
                  style: isButtonEnabled
                      ? const ButtonStyle()
                      : const ButtonStyle().copyWith(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).disabledColor)),
                  onPressed: () {
                    if (isButtonEnabled) {
                      context
                          .read<RecurringNotiBloc>()
                          .add(SaveRecurringNotiEvent(
                            message: messageController.text,
                            minute: widget.minute,
                            color: selectedColor != null
                                ? selectColors[selectedColor!]
                                : null,
                            icon: selectedIcon != null
                                ? selectIcons[selectedIcon!]
                                : null,
                          ));
                      NotificationService().showRecurringNotification(
                          title: messageController.text, minute: widget.minute);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(
                            page: 1,
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
          ),
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
                IconButton(
                  onPressed: () {
                    panelController.close();
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 25.0,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 185, 185, 185),
              ),
            ),
            Text(
              'Background colors',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: const Color(0xFF747377)),
            ),
            const SizedBox(
              height: 11,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 5.75,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return _colorBox(colors[index], index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Select icons',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: const Color(0xFF747377)),
            ),
            const SizedBox(
              height: 11,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 5.75,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return _iconBox(icons[index], index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
              ),
            ),
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
        height: MediaQuery.of(context).size.width / 5.75,
        width: MediaQuery.of(context).size.width / 5.75,
        decoration: selectedIcon == index
            ? BoxDecoration(
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(100))
            : const BoxDecoration(),
        child: Container(
            height: MediaQuery.of(context).size.width / 6.2,
            width: MediaQuery.of(context).size.width / 6.2,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 220, 220, 220)),
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(icon)),
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
        height: MediaQuery.of(context).size.width / 5.75,
        width: MediaQuery.of(context).size.width / 5.75,
        decoration: selectedColor == index
            ? BoxDecoration(
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(100))
            : const BoxDecoration(),
        child: Container(
          height: MediaQuery.of(context).size.width / 6.2,
          width: MediaQuery.of(context).size.width / 6.2,
          decoration: BoxDecoration(
              color: Color(color),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 220, 220, 220)),
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = messageController.text.isNotEmpty && true;
    });
  }
}
