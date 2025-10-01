import 'dart:io';

import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ABSideMenuItem extends StatefulWidget {
  final NavigationItem item;
  final String? primaryMenuKey;
  final String? secondaryMenuKey;
  final Function(NavigationItem) onItemTap;
  final Function(NavigationItem mainItem, NavigationItem subItem) onSubItemTap;

  const ABSideMenuItem({
    super.key,
    required this.item,
    required this.primaryMenuKey,
    required this.secondaryMenuKey,
    required this.onItemTap,
    required this.onSubItemTap,
  });

  @override
  State<ABSideMenuItem> createState() => _ABSideMenuItemState();
}

class _ABSideMenuItemState extends State<ABSideMenuItem> {
  String? hoveredKey;
  @override
  Widget build(BuildContext context) {
    if (widget.item.desktopOnly == true && !isDesktop(context)) {
      return Container();
    }
    if (widget.item.mobileOnly == true && isDesktop(context)) {
      return Container();
    }
    if (widget.item.subItems == null || widget.item.subItems!.isEmpty) {
      // return the main item with the icon and the label
      return _buildItemRow(
        context,
        widget.item,
        selected: (widget.item.key as ValueKey).value == widget.primaryMenuKey,
        padding: EdgeInsets.only(bottom: $constants.insets.sm),
        margin: EdgeInsets.symmetric(
          horizontal: $constants.insets.xs,
          vertical: $constants.insets.xxs,
        ),
        onTap: () => widget.onItemTap(widget.item),
      );
    } else {
      final children = <Widget>[];
      for (var subItem in widget.item.subItems!) {
        bool selected = false;
        if ((subItem.key as ValueKey).value == widget.secondaryMenuKey &&
            (widget.item.key as ValueKey).value == widget.primaryMenuKey) {
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
            onTap: () => widget.onSubItemTap(widget.item, subItem),
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemRow(
            context,
            widget.item,
            padding: EdgeInsets.only(bottom: $constants.insets.xxs),
            onTap: () => widget.onItemTap(widget.item),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalDivider(color: Colors.grey.shade300),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: $constants.insets.xs,
                      bottom: $constants.insets.xs,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
      onEnter: (event) => setState(() => hoveredKey = (item.key as ValueKey).value),
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
}
