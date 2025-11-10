import 'package:ab_shared/components/app/window_layout/window_layout_controller.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
  // Resizable state
  double? _width;
  double? _contentHeight;
  // Minimum sizes to keep UI usable
  final double _minWidth = 200;
  final double _minContentHeight = 100;
  // Height of the overlay area above the header where top handles live
  final double _handleOverlayHeight = 18;

  @override
  void initState() {
    _isCollapsed = widget.initiallyCollapsed ?? false;
    _width = widget.width ?? defaultWidth;
    _contentHeight = widget.contentHeight ?? defaultContentHeight;
    super.initState();
  }

  void onClose(BuildContext context) {
    // Override to add custom close behavior
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = (_width ?? widget.width ?? defaultWidth).clamp(
      _minWidth,
      double.infinity,
    );
    final currentHeaderHeight = widget.headerHeight ?? defaultHeaderHeight;
    final currentContentHeight = (_contentHeight ??
            widget.contentHeight ??
            defaultContentHeight)
        .clamp(_minContentHeight, double.infinity);

    final totalHeight =
        _handleOverlayHeight +
        currentHeaderHeight +
        (!(_isCollapsed ?? false) ? currentContentHeight : 0);

    // handle geometry
    final double handleWidth = 18;
    final double handleHeight = _handleOverlayHeight;
    final double horizontalPadding = $constants.insets.sm;

    return Material(
      color: getTheme(context).surface,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular($constants.corners.lg),
        topRight: Radius.circular($constants.corners.lg),
      ),
      elevation: 10,
      child: SizedBox(
        width: currentWidth,
        height: totalHeight,
        child: Stack(
          children: [
            // Main column positioned below the top handle overlay
            Positioned(
              left: 0,
              top: _handleOverlayHeight,
              child: SizedBox(
                width: currentWidth,
                height: totalHeight - _handleOverlayHeight,
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
                        height: currentHeaderHeight,
                        width: currentWidth,
                        padding: EdgeInsets.symmetric(
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
                                getIt<WindowLayoutController>().removeWindow(
                                  widget,
                                );
                                onClose(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!(_isCollapsed ?? false))
                      // content stacked with side handles
                      Stack(
                        children: [
                          SizedBox(
                            height: currentContentHeight,
                            width: currentWidth,
                            child: body(context),
                          ),
                          // Right-side vertical handle (horizontal resize)
                          // Positioned(
                          //   right: 0,
                          //   top: (currentContentHeight / 2) - 30,
                          //   child: MouseRegion(
                          //     cursor: SystemMouseCursors.resizeLeftRight,
                          //     child: GestureDetector(
                          //       behavior: HitTestBehavior.translucent,
                          //       onPanUpdate: (details) {
                          //         setState(() {
                          //           final newWidth = (currentWidth +
                          //                   details.delta.dx)
                          //               .clamp(_minWidth, double.infinity);
                          //           _width = newWidth;
                          //         });
                          //       },
                          //       child: Padding(
                          //         padding: EdgeInsets.only(
                          //           right: $constants.insets.xxs,
                          //         ),
                          //         child: _buildHandle(context),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Left-side vertical handle (horizontal resize)
                          Positioned(
                            left: 0,
                            top: (currentContentHeight / 2) - 30,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.resizeLeftRight,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onPanUpdate: (details) {
                                  setState(() {
                                    final newWidth = (currentWidth -
                                            details.delta.dx)
                                        .clamp(_minWidth, double.infinity);
                                    _width = newWidth;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: $constants.insets.xxs,
                                  ),
                                  child: _buildHandle(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            // Top-center handle overlaying the very top (above header)
            if (!(_isCollapsed ?? false))
              Positioned(
                left: (currentWidth / 2) - 20,
                top: 0,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpDown,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanUpdate: (details) {
                      setState(() {
                        // Dragging from the top: moving finger down (positive dy) should decrease content height
                        final newHeight = (currentContentHeight -
                                details.delta.dy)
                            .clamp(_minContentHeight, double.infinity);
                        _contentHeight = newHeight;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: $constants.insets.xxs),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: _buildHandle(context),
                      ),
                    ),
                  ),
                ),
              ),
            // Top-left corner (overlaying very top-left but inside horizontal padding)
            if (!(_isCollapsed ?? false))
              Positioned(
                left: (horizontalPadding / 2) - (handleWidth / 2),
                top: 0,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpLeftDownRight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanUpdate: (details) {
                      setState(() {
                        // For left/top corner: moving right (positive dx) should reduce width, moving down (positive dy) should reduce height
                        final newWidth = (currentWidth - details.delta.dx)
                            .clamp(_minWidth, double.infinity);
                        final newHeight = (currentContentHeight -
                                details.delta.dy)
                            .clamp(_minContentHeight, double.infinity);
                        _width = newWidth;
                        _contentHeight = newHeight;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: $constants.insets.xxs + 2,
                        top: $constants.insets.xxs + 2,
                      ),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: getTheme(context).surfaceContainer.darken(10),
                          borderRadius: BorderRadius.circular(
                            $constants.corners.sm,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Container(
      width: 4,
      height: 25,
      decoration: BoxDecoration(
        color: getTheme(context).surfaceContainer.darken(10),
        borderRadius: BorderRadius.circular($constants.corners.sm),
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
