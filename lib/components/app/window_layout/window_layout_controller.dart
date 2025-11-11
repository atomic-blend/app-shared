import 'package:ab_shared/components/app/window_layout/window_layout_widget.dart';
import 'package:flutter/widgets.dart';

/// Internal entry which pairs a stable [key] with the widget instance.
class WindowLayoutEntry {
  final Key key;
  final WindowLayoutWidget widget;

  WindowLayoutEntry({required this.key, required this.widget});
}

class WindowLayoutController extends ChangeNotifier {
  // internal entries with stable keys so widgets keep their State when reordered
  final List<WindowLayoutEntry> _entries = [];

  /// Expose a read-only view of widgets for compatibility, but prefer using
  /// [entries] when you need the stable key as well.
  List<WindowLayoutWidget> get windows =>
      _entries.map((e) => e.widget).toList();

  List<WindowLayoutEntry> get entries => List.unmodifiable(_entries);

  void addWindow(WindowLayoutWidget window) {
    // assign a stable key for the entry that won't change across reorders
    _entries.add(WindowLayoutEntry(key: UniqueKey(), widget: window));
    notifyListeners();
  }

  void removeWindow(WindowLayoutWidget window) {
    final idx = _entries.indexWhere((e) => e.widget == window);
    if (idx >= 0) {
      _entries.removeAt(idx);
      notifyListeners();
    }
  }

  /// Move an entry from [from] index to [to] index and notify listeners.
  /// [to] is an insertion index (0..length) meaning insert before that index.
  void reorder(int from, int to) {
    if (from == to) return;
    if (from < 0 || from >= _entries.length) return;
    if (to < 0 || to > _entries.length) return;
    final item = _entries.removeAt(from);
    final insertIndex = to > from ? to - 1 : to;
    _entries.insert(insertIndex, item);
    notifyListeners();
  }

  void swapWindows(int index1, int index2) {
    if (index1 < 0 || index1 >= _entries.length) return;
    if (index2 < 0 || index2 >= _entries.length) return;
    final temp = _entries[index1];
    _entries[index1] = _entries[index2];
    _entries[index2] = temp;
    notifyListeners();
  }
}
