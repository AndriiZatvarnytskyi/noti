import 'package:flutter/material.dart';
import 'package:noti/view/home_view/widgets/custom_app_bar_widget.dart';
import 'package:noti/view/home_view/widgets/one_time_noti_list_view_widget.dart';
import 'package:noti/view/home_view/widgets/recurring_noti_group_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.page});
  final int page;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _myPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: widget.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        CustomAppBarWidget(
          pageController: _myPage,
          initPage: widget.page,
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 176,
            child: PageView(
              controller: _myPage,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OneTimeNotiListViewWidget(),
                RecurringNotiGroupListWidget(),
              ], // Comment this if you need to use Swipe.
            ),
          ),
        ),
      ]),
    );
  }
}
