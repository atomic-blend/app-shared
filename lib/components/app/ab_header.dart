import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get_it/get_it.dart';

class ABHeader extends StatefulWidget {
  final String title;
  const ABHeader({super.key, required this.title});

  @override
  State<ABHeader> createState() => _ABHeaderState();
}

class _ABHeaderState extends State<ABHeader> {
  final getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $constants.insets.sm,
        right: $constants.insets.sm,
        top: $constants.insets.xs,
        bottom: $constants.insets.xs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: []),
          Text(widget.title),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.ellipsis)),
            ],
          ),
        ],
      ),
    );
  }
}
