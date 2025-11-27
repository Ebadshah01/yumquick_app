import 'package:flutter/material.dart';

class OrderStatusModel extends ChangeNotifier {

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectedStatus (int index){
    _selectedIndex = index;
    notifyListeners();
  }  
}