import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/domain/entity/one_time_noti.dart';
import 'package:noti/view/add_one_time_noti_view/add_one_time_noti_view.dart';
import 'package:noti/view/home_view/widgets/one_time_noti_container_widget.dart';

class OneTimeNotiListViewWidget extends StatefulWidget {
  const OneTimeNotiListViewWidget({super.key});

  @override
  State<OneTimeNotiListViewWidget> createState() =>
      _OneTimeNotiListViewWidgetState();
}

class _OneTimeNotiListViewWidgetState extends State<OneTimeNotiListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 16.0),
              itemCount: oneTimeNotiBox.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                OneTimeNoti noti = oneTimeNotiBox.getAt(index);
                return NotiContainerWidget(
                  index: index,
                  updateState: updateState,
                  message: noti.message,
                  time: '${noti.notificationHour}:${noti.notificationMinute}',
                  icon: noti.icon,
                  color: noti.color,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddOneTimeNotiView(),
                    ),
                  );
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/add_circle.png',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Add new notification',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  void updateState() {
    setState(() {});
  }
}
