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
  final bool collapsible;
  final bool initiallyExpanded;

  const ABSideMenuItem({
    super.key,
    required this.item,
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
        selected: isItemSelected(widget.item),
        padding: EdgeInsets.only(bottom: $constants.insets.sm),
        margin: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xxs,
        ),
        onTap: () => context.go(widget.item.location ?? '/'),
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
            margin: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs,
            ),
            onTap: () => context.go(subItem.location ?? '/'),
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
            margin: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs,
            ),
            onTap:
                widget.collapsible
                    ? _toggleExpanded
                    : () => context.go(widget.item.location ?? '/'),
            showArrow: widget.collapsible,
            isExpanded: _isExpanded,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              // vertical: $constants.insets.xxs,
            ),
            child: SizeTransition(
              sizeFactor: _expandAnimation,
              child: IntrinsicHeight(
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
        child: Padding(
          padding: padding ?? EdgeInsets.only(bottom: $constants.insets.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  selected == true ||
                          (hoveredKey == (item.key as ValueKey).value &&
                              (item.subItems == null || item.subItems!.isEmpty))
                      ? isDarkMode(context)
                          ? getTheme(context).surfaceContainer.lighten(10)
                          : getTheme(context).surfaceContainer.darken(5)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular($constants.corners.sm),
            ),
            padding: margin,
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
                if (showArrow)
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ),
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
}
