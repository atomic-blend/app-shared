import 'package:ab_shared/components/app/window_layout/window_layout_controller.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WindowLayoutWidget extends StatefulWidget {
  final bool? initiallyCollapsed;
  final double? contentHeight;
  final double? headerHeight;
  final double? width;

  const WindowLayoutWidget({
    super.key,
    this.initiallyCollapsed,
    this.contentHeight,
    this.headerHeight,
    this.width,
  });

  @override
  State<WindowLayoutWidget> createState() => WindowLayoutWidgetState();
}

class WindowLayoutWidgetState extends State<WindowLayoutWidget> {
  final getIt = GetIt.instance;
  final double defaultWidth = 300;
  final double defaultHeaderHeight = 50;
  final double defaultContentHeight = 400;
  bool? _isCollapsed;

  @override
  void initState() {
    _isCollapsed = widget.initiallyCollapsed ?? false;
    super.initState();
  }

  void onClose(BuildContext context) {
    // Override to add custom close behavior
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getTheme(context).surface,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular($constants.corners.lg),
        topRight: Radius.circular($constants.corners.lg),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isCollapsed = !(_isCollapsed ?? false);
              });
            },
            child: Container(
              height: widget.headerHeight ?? defaultHeaderHeight,
              width: widget.width ?? defaultWidth,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: $constants.insets.sm,
              ),
              child: Row(
                children: [
                  Expanded(child: header(context)),
                  InkWell(
                    child: Icon(CupertinoIcons.minus, size: 20),
                    onTap: () {
                      setState(() {
                        _isCollapsed = !(_isCollapsed ?? false);
                      });
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  InkWell(
                    child: Icon(CupertinoIcons.xmark, size: 20),
                    onTap: () {
                      getIt<WindowLayoutController>().removeWindow(widget);
                      onClose(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          if (!(_isCollapsed ?? false))
            SizedBox(
              height: widget.contentHeight ?? defaultContentHeight,
              width: widget.width ?? defaultWidth,
              child: body(context),
            ),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return const Placeholder();
  }

  Widget body(BuildContext context) {
    return const Placeholder();
  }
}
