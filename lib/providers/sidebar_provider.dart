import 'package:flutter/material.dart';

class SidebarProvider extends ChangeNotifier {
  int _drawerSelectedIndex = 1; // Set the initial selected index to 1

  int get drawerSelectedIndex => _drawerSelectedIndex;

  set drawerSelectedIndex(int index) {
    _drawerSelectedIndex = index;
    notifyListeners();
  }
}
