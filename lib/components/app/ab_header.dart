import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get_it/get_it.dart';

class ABHeader extends StatelessWidget {
  final getIt = GetIt.instance;
  final String title;
  ABHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $constants.insets.sm,
        right: $constants.insets.sm,
        top: isDesktop(context) ? $constants.insets.md : $constants.insets.xs,
        bottom: $constants.insets.xs,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (isDesktop(context)) {
                final sideMenuController = getIt<SideMenuController>();
                sideMenuController.toggle();
              } else {
                final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
                scaffoldKey.currentState?.openDrawer();
              }
            },
            icon: Icon(CupertinoIcons.sidebar_left),
          ),
          SizedBox(width: $constants.insets.sm),
          Text(title),
        ],
      ),
    );
  }
}
