import 'package:ab_shared/blocs/auth/auth.bloc.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Padding(
          padding: EdgeInsets.all($constants.insets.xs),
          child: ElevatedContainer(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: $constants.corners.sm,
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.sm),
              child: SideMenu(
                controller: controller,
                mode: SideMenuMode.open,
                minWidth: getSize(context).width * 0.04,
                maxWidth: 200,
                backgroundColor: getTheme(context).surfaceContainer,
                hasResizer: false,
                hasResizerToggle: false,
                builder: (data) {
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
                                                        ? item.color!
                                                            .withValues(
                                                              alpha: 0.1,
                                                            )
                                                        : Colors.grey.shade500
                                                            .withValues(
                                                              alpha: 0.2,
                                                            ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      $constants.corners.lg,
                                                    ),
                                              ),
                                              child:
                                                  item.initialsOnly == true
                                                      ? Center(
                                                        child: Text(
                                                          _getInitials(
                                                            item.label,
                                                          ),
                                                          style: getTextTheme(
                                                            context,
                                                          ).bodyLarge!.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                item.color !=
                                                                        null
                                                                    ? item
                                                                        .color!
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
                                                                : Icon(
                                                                  item.icon,
                                                                ),
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
      },
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
