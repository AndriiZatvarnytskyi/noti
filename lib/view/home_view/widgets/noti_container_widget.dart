// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/bloc/recurring_noti_bloc/recurring_noti_bloc.dart';
import 'package:noti/domain/boxes.dart';
import 'package:noti/view/triger_view/triger_view.dart';

class NotiContainerWidget extends StatelessWidget {
  final String message;
  final int? color;
  final String? time;
  final String? icon;
  final Function updateState;
  final int index;

  const NotiContainerWidget({
    Key? key,
    required this.message,
    this.color,
    this.time,
    this.icon,
    required this.updateState,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFB),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!),
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            icon!,
                          ),
                        ),
                      )
                    : const SizedBox(),
                time != null
                    ? Row(
                        children: [
                          Text(
                            'Time: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 14),
                          ),
                          Text(
                            time!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        message,
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  if (time!.contains('minute')) {
                    List notiList = recurringNotiBox.values.toList();
                    int notiIndex = notiList
                        .indexWhere((element) => element.message == message);
                    context
                        .read<RecurringNotiBloc>()
                        .add(DeleteRecurringNotiEvent(index: notiIndex));
                  } else {
                    context
                        .read<OneTimeNotiBloc>()
                        .add(DeleteOneTimeNotiEvent(index: index));
                  }
                
                  updateState();
                },
                child: SvgPicture.asset(
                  'assets/svg/delete_forever_icon.svg',
                  color: Theme.of(context).errorColor,
                  width: 24,
                  height: 24,
                )),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TrigerView(
                      title: 'Select triger 1',
                    );
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Select triger 1",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TrigerView(
                      title: 'Select triger 2',
                    );
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Select triger 2",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
