import 'package:ab_shared/components/forms/search_bar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ABHeader extends StatefulWidget {
  final String title;
  const ABHeader({super.key, required this.title});

  @override
  State<ABHeader> createState() => _ABHeaderState();
}

class _ABHeaderState extends State<ABHeader> {
  final getIt = GetIt.instance;
  final controller = TextEditingController();

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
          SizedBox(
            width: getSize(context).width * 0.5,
            child: ABSearchBar(
              controller: controller,
              showClearButton: true,
              onSubmitted: (value) {
                context.go("/search?q=$value");
              },
              onChanged: (value) {
                if (GoRouterState.of(context).uri.path == "/search") {
                  context.go("/search?q=$value");
                }
              },
            ),
          ),
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
