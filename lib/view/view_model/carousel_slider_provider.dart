import 'package:flutter/material.dart';

class CarouselSliderProvider extends ChangeNotifier {

  int currentIndex = 0;

  final imgUrl = [
    'assets/images/desert2.png',
    'assets/images/coffee.png',
    'assets/images/vegan2.png'
  ];

  void updateIndex (int index){
    currentIndex = index;
  }
  
  
}