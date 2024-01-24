// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noti/bloc/one_time_noti_bloc/one_time_noti_bloc.dart';
import 'package:noti/bloc/recurring_noti_bloc/recurring_noti_bloc.dart';
import 'package:noti/view/select_triger_view/select_triger_view.dart';

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
        color: color != null ? Color(color!) : Colors.white,
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
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!),
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            icon!,
                            scale: 1.8,
                            width: 20,
                            height: 19,
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
                  children: [
                    Text(
                      'Message: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (time == null) {
                  context
                      .read<RecurringNotiBloc>()
                      .add(DeleteRecurringNotiEvent(index: index));
                }
                if (time != null) {
                  context
                      .read<OneTimeNotiBloc>()
                      .add(DeleteOneTimeNotiEvent(index: index));
                }
                updateState();
              },
              child: Image.asset(
                'assets/icons/delete_forever_icon.png',
                // ignore: deprecated_member_use
                color: Theme.of(context).errorColor,
              ),
            ),
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
                    return const SelectTrigerView(
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
                    return const SelectTrigerView(
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
