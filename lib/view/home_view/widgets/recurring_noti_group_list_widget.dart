// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noti/view/requrring_noti_list_view/recurring_noti_list_view_widget.dart';

class RecurringNotiGroupListWidget extends StatelessWidget {
  const RecurringNotiGroupListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _groupBox(context, '1 Minute', 1),
        _groupBox(context, '3 Minute', 3),
        _groupBox(context, '5 Minute', 5),
      ],
    );
  }

  Widget _groupBox(context, text, minute) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecurringNotiListView(
                    minute: minute,
                    title: text,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            color: const Color(0xfff8fafb),
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: SvgPicture.asset(
                  'assets/svg/arrow_forward_ios.svg',
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xffE6E6E6),
          )
        ],
      ),
    );
  }
}
