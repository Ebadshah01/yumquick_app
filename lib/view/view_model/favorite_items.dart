 import 'package:flutter/material.dart';

// class FavoriteItems extends ChangeNotifier {
//   final List<int> _selectedItem = [];
//   List<int> get selectedItem => _selectedItem;

//   void addItems(int value) {
//     _selectedItem.add(value);
//     notifyListeners();
//   }

//   void removeItems(int value) {
//     _selectedItem.remove(value);
//     notifyListeners();
//   }
// }
class FavoriteItems extends ChangeNotifier {
  final List<Map<String, dynamic>> _selectedItems = [];
  List<Map<String, dynamic>> get selectedItems => _selectedItems;

  void addItem(Map<String, dynamic> item) {
    _selectedItems.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _selectedItems.remove(item);
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> item) {
    return _selectedItems.contains(item);
  }
}
