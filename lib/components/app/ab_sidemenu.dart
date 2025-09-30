import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class ABSideMenu extends StatelessWidget {
  final SideMenuController controller;
  final List<NavigationItem> primaryMenuItems;
  final Function(NavigationItem) onTap;
  const ABSideMenu({
    super.key,
    required this.controller,
    required this.primaryMenuItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($constants.insets.xs),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular($constants.corners.sm),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular($constants.corners.sm),
          child: SideMenu(
            controller: controller,
            mode: SideMenuMode.open,
            minWidth: getSize(context).width * 0.08,
            backgroundColor: getTheme(context).surfaceContainer,
            hasResizer: false,
            hasResizerToggle: false,
            builder: (data) {
              return SideMenuData(
                header: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: $constants.insets.sm,
                    horizontal: $constants.insets.sm,
                  ),
                  child: Row(
                    children: [
                      ElevatedContainer(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            $constants.corners.md,
                          ),
                          child: Image.asset("assets/images/appicon.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                customChild: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: $constants.insets.xs),
                      ...primaryMenuItems.map(
                        (item) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (item.separatorBefore != true)
                              SizedBox(height: $constants.insets.xxs),
                            if (item.separatorBefore == true)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: $constants.insets.sm,
                                ),
                                child: Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 2,
                                ),
                              ),
                            GestureDetector(
                              onTap: () => onTap(item),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: $constants.insets.sm,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            // border:
                                            //     appState.primaryMenuSelectedKey ==
                                            //             (item.key as ValueKey)
                                            //                 .value
                                            //         ? Border.all(
                                            //           color:
                                            //               Colors.grey.shade500,
                                            //           width: 1,
                                            //         )
                                            //         : null,
                                            color:
                                                item.color != null
                                                    ? item.color!.withValues(
                                                      alpha: 0.1,
                                                    )
                                                    : Colors.grey.shade500
                                                        .withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(
                                              $constants.corners.lg,
                                            ),
                                          ),
                                          child:
                                              item.initialsOnly == true
                                                  ? Center(
                                                    child: Text(
                                                      _getInitials(item.label),
                                                      style: getTextTheme(
                                                        context,
                                                      ).bodyLarge!.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            item.color != null
                                                                ? item.color!
                                                                : Colors
                                                                    .grey
                                                                    .shade800,
                                                      ),
                                                    ),
                                                  )
                                                  : IconTheme(
                                                    data: IconThemeData(
                                                      color:
                                                          item.color != null
                                                              ? item.color!
                                                              : Colors
                                                                  .grey
                                                                  .shade800,
                                                    ),
                                                    child:
                                                        isApple(context)
                                                            ? Icon(
                                                              item.cupertinoIcon,
                                                            )
                                                            : Icon(item.icon),
                                                  ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: $constants.insets.sm),
                                    Text(item.label),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '';

    return name
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .take(3)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
