import 'dart:io';

import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A customizable bottom navigation item for use with [BottomNavigation].
///
/// This widget wraps the Material [NavigationDestination] to provide additional
/// functionality like an optional onTap callback for individual items.
class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.cupertinoIcon,
    required this.label,
    this.selectedIcon,
    this.onTap,
    this.tooltip,
    this.desktopOnly,
    this.enabled = true,
    this.body,
    this.initialsOnly,
    this.appBar,
    this.mainSecondaryKey,
    this.color,
    this.separatorBefore,
    this.subItems,
    this.mobileOnly,
  });

  /// The icon displayed by the destination.
  final IconData icon;

  /// The Cupertino icon displayed by the destination.
  final IconData cupertinoIcon;

  /// The optional icon to display when this destination is selected.
  final Widget? selectedIcon;

  /// The label displayed by the destination.
  final String label;

  /// Optional tooltip for the destination.
  final String? tooltip;

  /// Optional body
  final Widget? body;

  /// Optional appbar
  final AppBar? appBar;

  /// Optional separatorBefore
  final bool? separatorBefore;

  /// Main secondary key (the default secondary screen)
  final String? mainSecondaryKey;

  /// Optional color
  final Color? color;

  /// Whether to show only initials in the destination.
  final bool? initialsOnly;

  /// Whether this destination is interactive.
  final bool enabled;

  /// Optional callback invoked when this item is tapped.
  ///
  /// The callback provides the index of the item in the navigation bar.
  final Function(int)? onTap;

  /// Optional sub items
  /// Used to display a list of items in a collapsible menu
  /// Usually used for the secondary menu
  final List<NavigationItem>? subItems;

  /// Optional desktopOnly
  /// Used to display an item only on desktop
  final bool? desktopOnly;

  /// Optional mobileOnly
  /// Used to display an item only on mobile
  final bool? mobileOnly;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}

class NavigationSection {
  const NavigationSection({required this.key, required this.items, this.title});

  /// The key of the section.
  final Key key;

  /// The title of the section.
  final String? title;

  /// The list of items in the section.
  final List<NavigationItem> items;
}

class ABNavbar extends StatefulWidget {
  final Function(String key) onPrimaryMenuSelected;
  final Function(String key) onSecondaryMenuSelected;
  final List<NavigationItem> destinations;
  final String primaryMenuKey;
  final Color? backgroundColor;
  final Function(int)? onTap;
  final double height = 65;
  final bool centerActionEnabled;
  final VoidCallback? centerActionCallback;
  final IconData? centerActionIcon;
  const ABNavbar({
    super.key,
    required this.onPrimaryMenuSelected,
    required this.onSecondaryMenuSelected,
    required this.destinations,
    required this.primaryMenuKey,
    this.backgroundColor,
    this.onTap,
    this.centerActionEnabled = false,
    this.centerActionCallback,
    this.centerActionIcon,
  });

  @override
  State<ABNavbar> createState() => _ABNavbarState();
}

class _ABNavbarState extends State<ABNavbar> {
  int selectedIndex = 0;

  // Filter out desktopOnly items
  List<NavigationItem> get filteredDestinations {
    return widget.destinations
        .where((item) => item.desktopOnly != true)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? getTheme(context).primaryContainer,
        borderRadius: BorderRadius.circular($constants.corners.full),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            offset: const Offset(0, 8),
            blurRadius: 16,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Show first 2 items
          ...filteredDestinations
              .take(2)
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    final index = filteredDestinations.indexOf(e);
                    setState(() {
                      selectedIndex = index;
                    });
                    // Check if the tapped item has its own onTap handler
                    if (filteredDestinations.length > index &&
                        e.onTap != null) {
                      e.onTap!(index);
                    }
                    // Otherwise use the default handler
                    else if (widget.onTap != null) {
                      widget.onTap!(index);
                    } else {
                      widget.onPrimaryMenuSelected(
                        (filteredDestinations[index].key as ValueKey).value,
                      );
                      if (e.mainSecondaryKey != null) {
                        widget.onSecondaryMenuSelected(e.mainSecondaryKey!);
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all($constants.insets.xxs),
                    child: Container(
                      padding: EdgeInsets.all($constants.insets.xs),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            getIcon(e.icon, e.cupertinoIcon),
                            color:
                                selectedIndex == filteredDestinations.indexOf(e)
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade600,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Text(
                              e.label,
                              style: getTextTheme(context).bodyMedium?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color:
                                    selectedIndex ==
                                            filteredDestinations.indexOf(e)
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          // Add center action button if enabled
          if (widget.centerActionEnabled && widget.centerActionIcon != null)
            GestureDetector(
              onTap: widget.centerActionCallback,
              child: Container(
                padding: EdgeInsets.all($constants.insets.xxs),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular($constants.corners.full),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: -4,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all($constants.insets.xs),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      $constants.corners.full,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        offset: const Offset(0, 8),
                        blurRadius: 4,
                        spreadRadius: -4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.centerActionIcon!,
                        color: Colors.grey.shade800,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          // Show last 2 items (or more if there are more than 4 total items)
          ...filteredDestinations
              .skip(2)
              .take(
                filteredDestinations.length > 4
                    ? 2
                    : filteredDestinations.length - 2,
              )
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    final originalIndex = filteredDestinations.indexOf(e);
                    setState(() {
                      selectedIndex = originalIndex;
                    });
                    // Check if the tapped item has its own onTap handler
                    if (filteredDestinations.length > originalIndex &&
                        e.onTap != null) {
                      e.onTap!(originalIndex);
                    }
                    // Otherwise use the default handler
                    else if (widget.onTap != null) {
                      widget.onTap!(originalIndex);
                    } else {
                      widget.onPrimaryMenuSelected(
                        (filteredDestinations[originalIndex].key as ValueKey)
                            .value,
                      );
                      if (e.mainSecondaryKey != null) {
                        widget.onSecondaryMenuSelected(e.mainSecondaryKey!);
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all($constants.insets.xxs),
                    child: Container(
                      padding: EdgeInsets.all($constants.insets.xs),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            getIcon(e.icon, e.cupertinoIcon),
                            color:
                                selectedIndex == filteredDestinations.indexOf(e)
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade600,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Text(
                              e.label,
                              style: getTextTheme(context).bodyMedium?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color:
                                    selectedIndex ==
                                            filteredDestinations.indexOf(e)
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          // Add "more" button if there are more than 4 items
          if (filteredDestinations.length > 4)
            GestureDetector(
              onTap: () {
                // Show modal with remaining items
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder:
                      (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all($constants.insets.md),
                              child: Row(
                                children: [
                                  Text(
                                    "More",
                                    style: getTextTheme(context).headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Icon(
                                      CupertinoIcons.xmark_circle_fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: filteredDestinations.length - 4,
                                itemBuilder: (context, index) {
                                  final item = filteredDestinations[4 + index];
                                  return ListTile(
                                    leading: Icon(
                                      getIcon(item.icon, item.cupertinoIcon),
                                    ),
                                    title: Text(item.label),
                                    onTap: () {
                                      Navigator.pop(context);
                                      if (item.onTap != null) {
                                        item.onTap!(4 + index);
                                      } else {
                                        widget.onPrimaryMenuSelected(
                                          (item.key as ValueKey).value,
                                        );
                                        if (item.mainSecondaryKey != null) {
                                          widget.onSecondaryMenuSelected(
                                            item.mainSecondaryKey!,
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                );
              },
              child: Container(
                padding: EdgeInsets.all($constants.insets.xxs),
                child: Container(
                  padding: EdgeInsets.all($constants.insets.xs),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.ellipsis_circle_fill,
                        color: Colors.grey.shade600,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "More",
                          style: getTextTheme(context).bodyMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData getIcon(IconData iconData, IconData cupertinoIcon) {
    if (!kIsWasm && (Platform.isIOS || Platform.isMacOS)) {
      return cupertinoIcon;
    } else {
      return iconData;
    }
  }
}
