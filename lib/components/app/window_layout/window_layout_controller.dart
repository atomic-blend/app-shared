import 'package:ab_shared/components/app/window_layout/window_layout_widget.dart';
import 'package:flutter/widgets.dart';

class WindowLayoutController extends ChangeNotifier {
  List<WindowLayoutWidget> windows = [];

  void addWindow(WindowLayoutWidget window) {
    windows.add(window);
    notifyListeners();
  }

  void removeWindow(WindowLayoutWidget window) {
    windows.remove(window);
    notifyListeners();
  }
}
