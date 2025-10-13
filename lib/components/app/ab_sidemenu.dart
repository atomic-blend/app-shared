import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_apps_popup.dart';
import 'package:ab_shared/components/app/ab_sidemenu_item.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/initial_avatar.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';

class ABSideMenu extends StatefulWidget {
  final SideMenuController controller;
  final List<NavigationItem> items;
  final Widget? actionWidget;
  const ABSideMenu({
    super.key,
    required this.controller,
    required this.items,
    this.actionWidget,
  });

  @override
  State<ABSideMenu> createState() => _ABSideMenuState();
}

class _ABSideMenuState extends State<ABSideMenu> {
  String? hoveredKey;

  // Check if an item is selected by comparing current location with item location
  bool isItemSelected(NavigationItem item) {
    final currentLocation = GoRouterState.of(context).uri.path;
    return currentLocation == item.location;
  }

  // Get the action from the currently selected navigation item
  NavigationAction? getCurrentPageAction() {
    // First, check if any main item is selected and has an action
    for (final item in widget.items) {
      if (isItemSelected(item) && item.action != null) {
        return item.action;
      }
    }

    // If no main item action found, check subitems
    for (final item in widget.items) {
      if (item.subItems != null) {
        for (final subItem in item.subItems!) {
          if (isItemSelected(subItem)) {
            // If subitem has its own action, use it
            if (subItem.action != null) {
              return subItem.action;
            }
            // If subitem has no action, fallback to parent item's action
            if (item.action != null) {
              return item.action;
            }
          }
        }
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Padding(
          padding: EdgeInsets.all(
            isDesktop(context) ? $constants.insets.xs : 0,
          ),
          child: ElevatedContainer(
            border: Border.all(
              color: isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
              width: 1,
            ),
            borderRadius: $constants.corners.sm,
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.sm),
              child: SafeArea(
                child: SideMenu(
                  controller: widget.controller,
                  mode: SideMenuMode.open,
                  minWidth: 80,
                  maxWidth:
                      isDesktop(context) ? 250 : getSize(context).width * 0.6,
                  backgroundColor: getTheme(context).surfaceContainer,
                  hasResizer: false,
                  //To support this, the navbar components shoud not display the labels and display a discord like navbar
                  hasResizerToggle: false,
                  builder: (data) {
                    return SideMenuData(
                      header: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.xs + 4,
                        ),
                        child: ABAppsPopup(
                          collapsed: widget.controller.isCollapsed(),
                        ),
                      ),
                      footer: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.xs,
                        ),
                        child: Column(
                          children: [
                            if (isDesktop(context)) ...[
                              GestureDetector(
                                onTap: () {
                                  widget.controller.toggle();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      widget.controller.isCollapsed()
                                          ? MainAxisAlignment.center
                                          : MainAxisAlignment.start,
                                  children: [
                                    if (widget.controller.isCollapsed() != true)
                                      SizedBox(width: $constants.insets.sm),
                                    Icon(
                                      CupertinoIcons.sidebar_left,
                                      size: 20,
                                      color: Colors.grey.shade600,
                                    ),
                                    if (widget.controller.isCollapsed() !=
                                        true) ...[
                                      SizedBox(width: $constants.insets.sm),
                                      Text(
                                        "Collapse",
                                        style: getTextTheme(
                                          context,
                                        ).bodyMedium!.copyWith(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              SizedBox(height: $constants.insets.sm),
                            ],
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (widget.controller.isCollapsed() != true)
                                  SizedBox(width: $constants.insets.xs),
                                InitialAvatar(
                                  size: 50,
                                  borderRadius: $constants.corners.lg,
                                  name:
                                      authState.user?.firstname != null
                                          ? "${authState.user?.firstname} ${authState.user?.lastname}"
                                          : "Atomic Blend",
                                ),
                                if (widget.controller.isCollapsed() !=
                                    true) ...[
                                  SizedBox(width: $constants.insets.sm),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          authState.user?.firstname != null
                                              ? "${authState.user?.firstname}${authState.user?.lastname != null ? " ${authState.user?.lastname}" : ""}"
                                              : context.t.app_name,
                                          style: getTextTheme(
                                            context,
                                          ).bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        AutoSizeText(
                                          authState.user?.email ?? "",
                                          maxLines: 1,
                                          minFontSize: 10,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              getTextTheme(
                                                context,
                                              ).bodyMedium!.copyWith(),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      customChild: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.xs,
                          ),
                          child: Column(
                            crossAxisAlignment:
                                widget.controller.isCollapsed()
                                    ? CrossAxisAlignment.center
                                    : CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (getCurrentPageAction() != null) ...[
                                SizedBox(height: $constants.insets.xs),
                                _buildActionWidget(getCurrentPageAction()!),
                                SizedBox(height: $constants.insets.xs),
                              ],
                              SizedBox(height: $constants.insets.xs),
                              ...widget.items.map((item) {
                                if (item.enabled == false) {
                                  return SizedBox.shrink();
                                }
                                return ABSideMenuItem(
                                  item: item,
                                  collapsed: widget.controller.isCollapsed(),
                                  collapsible: true,
                                  initiallyExpanded: true,
                                );
                              }),
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

  Widget _buildActionWidget(NavigationAction action) {
    return PrimaryButtonSquare(
      text: widget.controller.isCollapsed() ? null : action.label,
      icon: action.icon,
      iconColor: Colors.white,
      onPressed: action.onTap,
    );
  }
}
