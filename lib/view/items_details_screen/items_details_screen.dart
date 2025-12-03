import 'package:flutter/material.dart';

class ItemsDetailsScreen extends StatelessWidget {
   final Map<String, String> item;

  const ItemsDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Hero(
         tag: item['img']!,  
          child: Image.asset(item['img']!))
        ],
      ),
    );
  }
}