import 'package:flutter/material.dart';

class ItemQuantityModel extends ChangeNotifier {
  int quantity = 1;
  double itemPrice = 0.0;

   void setPrice (double price){
    itemPrice = price;
   }
  
   double get totalPrice => quantity* itemPrice;

  void  increase (){
    quantity++;
    notifyListeners();
  }

  void decrease (){
    if (quantity >1) {
          quantity--;

    }
    notifyListeners();
  }
}