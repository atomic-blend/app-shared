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
                  minWidth:
                      isDesktop(context) ? 250 : getSize(context).width * 0.6,
                  maxWidth:
                      isDesktop(context) ? 250 : getSize(context).width * 0.6,
                  backgroundColor: getTheme(context).surfaceContainer,
                  hasResizer: false,
                  hasResizerToggle: false,
                  builder: (data) {
                    //TODO: header with the list of apps available + open with deep link in a custom popup
                    return SideMenuData(
                      header: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.xs + 4,
                        ),
                        child: ABAppsPopup(),
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
                            horizontal: $constants.insets.xs,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: $constants.insets.xs),
                              ...widget.primaryMenuItems.map((item) {
                                return ABSideMenuItem(
                                  item: item,
                                  primaryMenuKey: widget.primaryMenuKey,
                                  secondaryMenuKey: widget.secondaryMenuKey,
                                  onItemTap: widget.onItemTap,
                                  onSubItemTap: widget.onSubItemTap,
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
}
