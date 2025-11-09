import 'package:ab_shared/components/app/window_layout/window_layout_controller.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class WindowLayout extends StatelessWidget {
  final WindowLayoutController controller;
  final Widget child;
  const WindowLayout({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder:
          (context, _) => Stack(
            children: [
              child,
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [...controller.windows],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
