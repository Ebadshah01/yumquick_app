import 'package:flutter/material.dart';

class CancelReasonModel extends ChangeNotifier{
  int selectedIndex =-1;

  void selectReason(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void clearSelection() {
    selectedIndex = -1;
    notifyListeners();
  }
}