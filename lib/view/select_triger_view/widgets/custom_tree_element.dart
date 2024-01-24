import 'package:flutter/material.dart';

class TreeElement extends StatefulWidget {
  const TreeElement({
    required this.text,
    this.children,
    super.key,
  });
  final List<TreeElement>? children;
  final String text;

  @override
  State<TreeElement> createState() => _TreeElementState();
}

class _TreeElementState extends State<TreeElement> {
  bool isSelected = false;
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    double rW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: rW,
          margin: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    widget.children != null && widget.children!.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Container(
                              child: isOpen
                                  ? RotatedBox(
                                      quarterTurns: -1,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isOpen = !isOpen;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    )
                                  : RotatedBox(
                                      quarterTurns: 1,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isOpen = !isOpen;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    ),
                            ),
                          )
                        : const SizedBox(
                            width: 17.0,
                          ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: 260,
                      child: Text(widget.text,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: widget.children != null &&
                                  widget.children!.isNotEmpty
                              ? Theme.of(context).textTheme.titleSmall
                              : Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .color)),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xFFF3F3F4),
                                border:
                                    Border.all(color: const Color(0xffE6E6E6))),
                          ),
                          isSelected
                              ? Icon(
                                  Icons.check_circle_sharp,
                                  size: 26,
                                  color: Theme.of(context).primaryColor,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              widget.children != null && widget.children!.isNotEmpty && isOpen
                  ? SizedBox(
                      child: Column(
                        children: widget.children!,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        widget.children != null && widget.children!.isNotEmpty
            ? Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xffE6E6E6),
              )
            : const SizedBox()
      ],
    );
  }
}
