import 'dart:io';

import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

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
    this.desktopOnly,
    this.enabled = true,
    this.location,
    this.color,
    this.subItems,
    this.mobileOnly,
    this.action,
  });

  /// The location of the destination.
  final String? location;

  /// The icon displayed by the destination.
  final IconData icon;

  /// The Cupertino icon displayed by the destination.
  final IconData cupertinoIcon;

  /// The optional icon to display when this destination is selected.
  final Widget? selectedIcon;

  /// The label displayed by the destination.
  final String label;

  /// Optional color
  final Color? color;

  /// Whether this destination is interactive.
  final bool enabled;

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

  /// Optional action
  final NavigationAction? action;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}

class NavigationAction {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const NavigationAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });
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
  // Filter out desktopOnly items
  List<NavigationItem> get filteredDestinations {
    return widget.destinations
        .where((item) => item.desktopOnly != true)
        .toList();
  }

  // Check if an item is selected by comparing current location with item location
  bool isItemSelected(NavigationItem item) {
    final currentLocation = GoRouterState.of(context).uri.path;
    return currentLocation == item.location;
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
                    context.go(e.location ?? '/');
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
                                isItemSelected(e)
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
                                    isItemSelected(e)
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
                    context.go(e.location ?? '/');
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
                                isItemSelected(e)
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
                                    isItemSelected(e)
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
