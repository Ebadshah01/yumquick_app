import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisibilityModel extends ChangeNotifier {
  bool _obscureText;

  VisibilityModel({bool initial = true}) : _obscureText =initial;

  bool get obscureText => _obscureText;

  void toggle(){
    _obscureText = !_obscureText;
    notifyListeners();
  }
}