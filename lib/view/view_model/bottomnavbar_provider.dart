import 'package:flutter/material.dart';
import 'package:yum_quick/view/auth/login_view.dart';
import 'package:yum_quick/view/auth/signup_view.dart';
import 'package:yum_quick/view/home/home_view.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final items = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.dining_sharp, 'label': 'Idea'},
    {'icon': Icons.favorite_border, 'label': 'Favorite'},
    {'icon': Icons.headphones , 'label': 'Help'},
  ];

  int get currentIndex => _currentIndex;

  void changeIndex (int index){
    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> views = [
    HomeView(),
    LoginView(),
    SignupView(),
    HomeView()
  ];
}