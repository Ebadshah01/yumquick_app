import 'package:flutter/material.dart';

class FoodCategoryModel extends ChangeNotifier {
  int _selectrdIndex  = -1;
  int get selectedIndex => _selectrdIndex;

  void selectedCategory(int index){
    _selectrdIndex = index;
    notifyListeners();
  }
  
}