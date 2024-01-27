import 'package:flutter/material.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/view/add_recurring_noti_view/add_recurring_noti_view.dart';
import 'package:noti/view/home_view/widgets/noti_container_widget.dart';
import 'package:noti/view/widgets/custom_app_bar.dart';

class RecurringNotiListView extends StatefulWidget {
  final String title;
  final int minute;
  const RecurringNotiListView(
      {super.key, required this.title, required this.minute});

  @override
  State<RecurringNotiListView> createState() => _RecurringNotiListViewState();
}

class _RecurringNotiListViewState extends State<RecurringNotiListView> {
  List<dynamic> notiList = [];

  @override
  Widget build(BuildContext context) {
    notiList = recurringNotiBox.values
        .where((element) => element.minute == widget.minute)
        .toList();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarWidget(
            title: widget.title,
            needButton: true,
          ),
          Padding(
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
                    itemCount: notiList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      int notiIndex =
                          recurringNotiBox.values.toList().indexWhere(
                                (element) =>
                                    element.message == notiList[index].message,
                              );
                      return NotiContainerWidget(
                        index: notiIndex,
                        updateState: updateState,
                        message: notiList[index].message,
                        icon: notiList[index].icon,
                        color: notiList[index].color,
                        time: widget.title.toLowerCase(),
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
                            builder: (context) => AddRecurringNotiView(
                              minute: widget.minute,
                              updateState: updateState,
                            ),
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
          ),
        ],
      ),
    );
  }

  void updateState() {
    setState(() {});
  }
}
