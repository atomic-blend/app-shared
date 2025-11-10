import 'package:ab_shared/components/app/window_layout/window_layout_controller.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class WindowLayout extends StatefulWidget {
  final WindowLayoutController controller;
  final Widget child;
  const WindowLayout({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  State<WindowLayout> createState() => _WindowLayoutState();
}

class _WindowLayoutState extends State<WindowLayout> {
  // Keys for each item slot so we can measure position/size. Keyed by
  // the controller-provided stable entry key so they survive reorders.
  final Map<Key, GlobalKey> _itemKeys = {};

  // Index currently being dragged (in the current list ordering)
  int? _draggingIndex;
  bool _isDragging = false;

  void _startDrag(int index) {
    setState(() {
      _draggingIndex = index;
      _isDragging = true;
    });
  }

  void _endDrag() {
    setState(() {
      _draggingIndex = null;
      _isDragging = false;
    });
  }

  void _onDragUpdate(Offset globalPosition) {
    final entries = widget.controller.entries;
    if (_draggingIndex == null) return;

    // Build array of centers for current items
    final centers = <double>[];
    for (var i = 0; i < entries.length; i++) {
      final entryKey = entries[i].key;
      final gKey = _itemKeys[entryKey];
      if (gKey == null) {
        centers.add(double.nan);
        continue;
      }
      final ctx = gKey.currentContext;
      if (ctx == null) {
        centers.add(double.nan);
        continue;
      }
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) {
        centers.add(double.nan);
        continue;
      }
      final offset = box.localToGlobal(Offset.zero);
      centers.add(offset.dx + (box.size.width / 2));
    }

    // Determine insertion index: first index whose center is greater than pointer
    final dx = globalPosition.dx;
    int to = entries.length; // default insert at end
    for (var i = 0; i < centers.length; i++) {
      final c = centers[i];
      if (c.isNaN) continue;
      if (dx < c) {
        to = i;
        break;
      }
    }

    final from = _draggingIndex!;
    if (to == from || to == from + 1) {
      // No meaningful move (to same place)
      return;
    }

    // Call controller to reorder using semantics: insert before item at index `to` (or end)
    widget.controller.reorder(from, to);

    // Update dragging index to the new location of the moved item
    final newIndex = (to > from) ? to - 1 : to;
    setState(() {
      _draggingIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        final entries = widget.controller.entries;

        // Remove any measuring keys that are no longer present
        _itemKeys.removeWhere(
          (k, v) => entries.indexWhere((e) => e.key == k) == -1,
        );

        final children = <Widget>[];
        for (var i = 0; i < entries.length; i++) {
          final entry = entries[i];
          final gKey = _itemKeys[entry.key] ??= GlobalKey();
          final window = entry.widget;

          Widget wrapped = GestureDetector(
            behavior: HitTestBehavior.opaque,
            // Start drag immediately on pointer move (click + drag)
            onPanStart: (_) => _startDrag(i),
            onPanUpdate: (details) => _onDragUpdate(details.globalPosition),
            onPanEnd: (_) => _endDrag(),
            child: Container(
              key: gKey,
              // Use a tighter horizontal margin to reduce spacing between windows
              margin: EdgeInsets.symmetric(horizontal: $constants.insets.xxs),
              // Use the stable entry.key so Flutter can keep the child's State
              // when its position in the Row changes.
              child: Opacity(
                opacity: (_isDragging && _draggingIndex == i) ? 0.6 : 1.0,
                child: KeyedSubtree(key: entry.key, child: window),
              ),
            ),
          );

          children.add(wrapped);
        }

        return Stack(
          children: [
            widget.child,
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: children,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
