import 'package:flutter/material.dart';
import 'package:noti/view/select_triger_view/widgets/custom_tree_element.dart';
import 'package:noti/view/select_triger_view/widgets/custom_tree_widget.dart';

class SelectTrigerView extends StatelessWidget {
  const SelectTrigerView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: Text(title),
        ),
        body: const SingleChildScrollView(
          child: CustomTreeWidget(
            title: 'All Trigers',
            children: [
              TreeElement(
                text: 'Sport',
                children: [
                  TreeElement(
                    text:
                        'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
                    children: [
                      TreeElement(
                        text: '🚴 Biking',
                      ),
                      TreeElement(text: '🏃Running'),
                    ],
                  ),
                  TreeElement(
                    text: 'Evening',
                    children: [
                      TreeElement(text: '🏓 Ping Pong'),
                      TreeElement(text: '🏐 Volleyball'),
                    ],
                  ),
                  TreeElement(
                    text: '🥊 Boxing',
                  ),
                  TreeElement(
                    text: '⚽ Football',
                  ),
                ],
              ),
              TreeElement(
                text: 'Work',
                children: [
                  TreeElement(
                    text: '🗓️ Meeting',
                  ),
                  TreeElement(
                    text: '🖨️ Print document',
                  ),
                ],
              ),
              TreeElement(
                text: '⏰ Allarm',
              ),
              TreeElement(
                text: '🎉 Party',
              ),
              TreeElement(
                text: '🍜 Dinner',
              ),
            ],
          ),
        ));
  }
}
