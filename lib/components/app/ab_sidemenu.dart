import 'dart:io';

import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/initial_avatar.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class ABSideMenu extends StatefulWidget {
  final SideMenuController controller;
  final List<NavigationItem> primaryMenuItems;
  final Function(NavigationItem) onItemTap;
  final Function(NavigationItem mainItem, NavigationItem subItem) onSubItemTap;
  final String? primaryMenuKey;
  final String? secondaryMenuKey;
  const ABSideMenu({
    super.key,
    required this.controller,
    required this.primaryMenuItems,
    required this.onItemTap,
    required this.onSubItemTap,
    this.primaryMenuKey,
    this.secondaryMenuKey,
  });

  @override
  State<ABSideMenu> createState() => _ABSideMenuState();
}

class _ABSideMenuState extends State<ABSideMenu> {
  String? hoveredKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Padding(
          padding: EdgeInsets.all(
            isDesktop(context) ? $constants.insets.xs : 0,
          ),
          child: ElevatedContainer(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: $constants.corners.sm,
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.sm),
              child: SafeArea(
                child: SideMenu(
                  controller: widget.controller,
                  mode: SideMenuMode.open,
                  minWidth: getSize(context).width * 0.04,
                  maxWidth: 200,
                  backgroundColor: getTheme(context).surfaceContainer,
                  hasResizer: false,
                  hasResizerToggle: false,
                  builder: (data) {
                    //TODO: header with the list of apps available + open with deep link in a custom popup
                    return SideMenuData(
                      header: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.xs,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  $constants.corners.md,
                                ),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  $constants.corners.md,
                                ),
                                child: Image.asset(
                                  "assets/images/atomic_blend_logo.png",
                                ),
                              ),
                            ),
                            SizedBox(width: $constants.insets.xs),
                            SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    context.t.app_name,
                                    style: getTextTheme(context).bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "See all the apps",
                                    style: getTextTheme(context).bodySmall!
                                        .copyWith(color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: $constants.insets.sm),
                            Icon(
                              CupertinoIcons.chevron_up_chevron_down,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                      footer: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.xs,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InitialAvatar(
                              name:
                                  authState.user?.firstname != null
                                      ? "${authState.user?.firstname} ${authState.user?.lastname}"
                                      : "Atomic Blend",
                            ),
                            SizedBox(width: $constants.insets.xs),
                            SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    authState.user?.firstname != null
                                        ? "${authState.user?.firstname}${authState.user?.lastname != null ? " ${authState.user?.lastname}" : ""}"
                                        : context.t.app_name,
                                    style: getTextTheme(context).bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  AutoSizeText(
                                    authState.user?.email ?? "",
                                    maxLines: 1,
                                    minFontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        getTextTheme(
                                          context,
                                        ).bodySmall!.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: $constants.insets.sm),
                            Icon(
                              CupertinoIcons.chevron_up_chevron_down,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                      customChild: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.md,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: $constants.insets.xs),
                              ...widget.primaryMenuItems.map((item) {
                                if (item.desktopOnly == true &&
                                    !isDesktop(context)) {
                                  return Container();
                                }
                                if (item.mobileOnly == true &&
                                    isDesktop(context)) {
                                  return Container();
                                }
                                if (item.subItems == null ||
                                    item.subItems!.isEmpty) {
                                  // return the main item with the icon and the label
                                  return _buildItemRow(
                                    context,
                                    item,
                                    selected:
                                        (item.key as ValueKey).value ==
                                        widget.primaryMenuKey,
                                    padding: EdgeInsets.only(
                                      bottom: $constants.insets.sm,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: $constants.insets.xs,
                                      vertical: $constants.insets.xxs,
                                    ),
                                    onTap: () => widget.onItemTap(item),
                                  );
                                } else {
                                  final children = <Widget>[];
                                  for (var subItem in item.subItems!) {
                                    bool selected = false;
                                    if ((subItem.key as ValueKey).value ==
                                            widget.secondaryMenuKey &&
                                        (item.key as ValueKey).value ==
                                            widget.primaryMenuKey) {
                                      selected = true;
                                    }
                                    // return the sub item with the icon and the label
                                    children.add(
                                      _buildItemRow(
                                        context,
                                        subItem,
                                        padding: EdgeInsets.zero,
                                        selected: selected,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: $constants.insets.xs,
                                          vertical: $constants.insets.xxs,
                                        ),
                                        onTap:
                                            () => widget.onSubItemTap(
                                              item,
                                              subItem,
                                            ),
                                      ),
                                    );
                                  }
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildItemRow(
                                        context,
                                        item,
                                        padding: EdgeInsets.only(
                                          bottom: $constants.insets.xxs,
                                        ),
                                        onTap: () => widget.onItemTap(item),
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            VerticalDivider(
                                              color: Colors.grey.shade300,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: $constants.insets.xs,
                                                  bottom: $constants.insets.xs,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  spacing: $constants.insets.xs,
                                                  children: [...children],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: $constants.insets.sm),
                                    ],
                                  );
                                }
                                return Container();
                              }),
                              // ...primaryMenuItems.map(
                              //   (item) => Column(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       GestureDetector(
                              //         onTap: () => onTap(item),
                              //         child: Padding(
                              //           padding: EdgeInsets.symmetric(
                              //             horizontal: $constants.insets.sm,
                              //           ),
                              //           child: Row(
                              //             children: [
                              //               Column(
                              //                 mainAxisSize: MainAxisSize.min,
                              //                 children: [
                              //                   Container(
                              //                     width: 40,
                              //                     height: 40,
                              //                     decoration: BoxDecoration(
                              //                       color:
                              //                           item.color != null
                              //                               ? item.color!
                              //                                   .withValues(
                              //                                     alpha: 0.1,
                              //                                   )
                              //                               : Colors.grey.shade500
                              //                                   .withValues(
                              //                                     alpha: 0.2,
                              //                                   ),
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                             $constants.corners.lg,
                              //                           ),
                              //                     ),
                              //                     child:
                              //                         item.initialsOnly == true
                              //                             ? Center(
                              //                               child: Text(
                              //                                 _getInitials(
                              //                                   item.label,
                              //                                 ),
                              //                                 style: getTextTheme(
                              //                                   context,
                              //                                 ).bodyLarge!.copyWith(
                              //                                   fontWeight:
                              //                                       FontWeight.bold,
                              //                                   color:
                              //                                       item.color !=
                              //                                               null
                              //                                           ? item
                              //                                               .color!
                              //                                           : Colors
                              //                                               .grey
                              //                                               .shade800,
                              //                                 ),
                              //                               ),
                              //                             )
                              //                             : IconTheme(
                              //                               data: IconThemeData(
                              //                                 color:
                              //                                     item.color != null
                              //                                         ? item.color!
                              //                                         : Colors
                              //                                             .grey
                              //                                             .shade800,
                              //                               ),
                              //                               child:
                              //                                   isApple(context)
                              //                                       ? Icon(
                              //                                         item.cupertinoIcon,
                              //                                       )
                              //                                       : Icon(
                              //                                         item.icon,
                              //                                       ),
                              //                             ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               SizedBox(width: $constants.insets.sm),
                              //               Text(item.label),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemRow(
    BuildContext context,
    NavigationItem item, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    VoidCallback? onTap,
    bool? selected,
  }) {
    return MouseRegion(
      onEnter:
          (event) => setState(() => hoveredKey = (item.key as ValueKey).value),
      onExit: (event) => setState(() => hoveredKey = null),
      child: GestureDetector(
        onTap: () => onTap?.call(),
        child: Padding(
          padding: padding ?? EdgeInsets.only(bottom: $constants.insets.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  selected == true ||
                          (hoveredKey == (item.key as ValueKey).value &&
                              (item.subItems == null || item.subItems!.isEmpty))
                      ? getTheme(context).surfaceContainer.darken(5)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular($constants.corners.sm),
            ),
            padding: margin,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                _getIcon(item),
                SizedBox(width: $constants.insets.xs),
                Text(item.label),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getIcon(NavigationItem item) {
    if (!kIsWasm && (Platform.isIOS || Platform.isMacOS)) {
      return Icon(item.cupertinoIcon, size: 18);
    } else {
      return Icon(item.icon, size: 18);
    }
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
