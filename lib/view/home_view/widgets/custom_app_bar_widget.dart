import 'package:flutter/material.dart';
import 'package:noti/view/home_view/widgets/app_bar_button.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget(
      {super.key, required this.pageController, required this.initPage});
  final PageController pageController;
  final int initPage;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initPage;
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 176,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 3,
            offset: const Offset(0, 4), // змістіть тінь вниз
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Text(
            'Notifications',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF3F3F4),
                  border:
                      Border.all(color: const Color(0xFFE6E6E6), width: 1.0)),
              child: Row(children: [
                AppBarButtonWidget(
                  text: 'One-time',
                  icon: 'assets/icons/clock.png',
                  isActive: _currentPage == 0 ? true : false,
                  onTap: () {
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
                AppBarButtonWidget(
                  text: 'Recurring',
                  icon: 'assets/icons/recurring.png',
                  isActive: _currentPage == 1 ? true : false,
                  onTap: () {
                    setState(() {
                      widget.pageController.jumpToPage(1);
                    });
                  },
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
