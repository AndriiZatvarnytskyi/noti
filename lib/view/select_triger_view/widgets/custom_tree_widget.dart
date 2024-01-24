import 'package:flutter/material.dart';
import 'package:noti/view/select_triger_view/widgets/custom_tree_element.dart';

class CustomTreeWidget extends StatefulWidget {
  const CustomTreeWidget(
      {super.key, required this.children, required this.title});
  final List<TreeElement> children;
  final String title;
  @override
  State<CustomTreeWidget> createState() => _CustomTreeWidgetState();
}

class _CustomTreeWidgetState extends State<CustomTreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          height: 56,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffE6E6E6),
        ),
        Column(
          children: widget.children,
        ),
      ],
    );
  }
}
