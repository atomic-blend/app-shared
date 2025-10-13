import 'dart:io';

import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ABSideMenuItem extends StatefulWidget {
  final NavigationItem item;
  // Whether the item is collapsed, ie the side menu is collapsed and iconsOnly are needed
  final bool collapsed;
  // Whether the item is collapsible, ie has sub items and can be collapsed
  final bool collapsible;
  final bool initiallyExpanded;

  const ABSideMenuItem({
    super.key,
    required this.item,
    this.collapsed = false,
    this.collapsible = false,
    this.initiallyExpanded = true,
  });

  @override
  State<ABSideMenuItem> createState() => _ABSideMenuItemState();
}

class _ABSideMenuItemState extends State<ABSideMenuItem>
    with TickerProviderStateMixin {
  String? hoveredKey;
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  // Check if an item is selected by comparing current location with item location
  bool isItemSelected(NavigationItem item) {
    final currentLocation = GoRouterState.of(context).uri.path;
    return currentLocation == item.location;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item.subItems == null || widget.item.subItems!.isEmpty) {
      // return the main item with the icon and the label
      return _buildItemRow(
        context,
        widget.item,
        selected: isItemSelected(widget.item),
        padding: EdgeInsets.only(bottom: $constants.insets.sm),
        margin: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xxs,
        ),
        onTap: () {
          if (widget.item.onTap != null) {
            widget.item.onTap!();
          } else {
            context.go(widget.item.location ?? '/');
          }
        },
      );
    } else {
      final children = <Widget>[];
      for (var subItem in widget.item.subItems!) {
        bool selected = isItemSelected(subItem);
        // return the sub item with the icon and the label
        children.add(
          _buildItemRow(
            context,
            subItem,
            padding: EdgeInsets.zero,
            selected: selected,
            margin:
                widget.collapsed
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xxs,
                    ),
            onTap: () {
              if (subItem.onTap != null) {
                subItem.onTap!();
              } else {
                context.go(subItem.location ?? '/');
              }
            },
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemRow(
            context,
            widget.item,
            showArrow: widget.collapsible,
            isExpanded: _isExpanded,

            padding: EdgeInsets.only(bottom: $constants.insets.xxs),
            margin: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs,
            ),
            onTap:
                widget.collapsible
                    ? _toggleExpanded
                    : () {
                      if (widget.item.onTap != null) {
                        widget.item.onTap!();
                      } else {
                        context.go(widget.item.location ?? '/');
                      }
                    },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.collapsed ? 0 : $constants.insets.sm,
              // vertical: $constants.insets.xxs,
            ),
            child: SizeTransition(
              sizeFactor: _expandAnimation,
              child:
                  widget.collapsed
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: $constants.insets.xs,
                        children: [...children],
                      )
                      : IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 2),
                            VerticalDivider(color: Colors.grey.shade300),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: $constants.insets.xs,
                                children: [...children],
                              ),
                            ),
                          ],
                        ),
                      ),
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
    bool showArrow = false,
    bool isExpanded = false,
  }) {
    return MouseRegion(
      onEnter:
          (event) => setState(() => hoveredKey = (item.key as ValueKey).value),
      onExit: (event) => setState(() => hoveredKey = null),
      child: GestureDetector(
        onTap: () => onTap?.call(),
        child: Stack(
          children: [
            if (showArrow)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding:
                    padding ?? EdgeInsets.only(bottom: $constants.insets.xs),
                child:
                    widget.collapsed
                        ? Container(
                          width: _isSubItem(item) ? 40 : 50,
                          height: _isSubItem(item) ? 40 : 50,
                          decoration: BoxDecoration(
                            color:
                                selected == true ||
                                        (hoveredKey ==
                                                (item.key as ValueKey).value &&
                                            (item.subItems == null ||
                                                item.subItems!.isEmpty))
                                    ? isDarkMode(context)
                                        ? getTheme(
                                          context,
                                        ).surfaceContainer.lighten(10)
                                        : getTheme(
                                          context,
                                        ).surfaceContainer.darken(5)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              $constants.corners.sm,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [_getIcon(item)],
                            ),
                          ),
                        )
                        : Container(
                          decoration: BoxDecoration(
                            color:
                                selected == true ||
                                        (hoveredKey ==
                                                (item.key as ValueKey).value &&
                                            (item.subItems == null ||
                                                item.subItems!.isEmpty))
                                    ? isDarkMode(context)
                                        ? getTheme(
                                          context,
                                        ).surfaceContainer.lighten(10)
                                        : getTheme(
                                          context,
                                        ).surfaceContainer.darken(5)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              $constants.corners.sm,
                            ),
                          ),
                          padding: widget.collapsed ? EdgeInsets.zero : margin,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _getIcon(item),
                              SizedBox(width: $constants.insets.sm),
                              Expanded(
                                child: Text(
                                  item.label,
                                  style: getTextTheme(context).bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon(NavigationItem item) {
    if (!kIsWasm && (Platform.isIOS || Platform.isMacOS)) {
      return Icon(item.cupertinoIcon, size: 22);
    } else {
      return Icon(item.icon, size: 20);
    }
  }

  bool _isSubItem(NavigationItem item) {
    // Check if this item is a sub-item by looking at the parent's subItems
    return widget.item.subItems?.contains(item) ?? false;
  }
}
