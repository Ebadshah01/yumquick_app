import 'package:flutter/material.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
  final recommendItemsList = [
     {
            'url': 'assets/images/snacks.png',
            'name': 'Pork Skewer',
            'rating': '4.0',
            'price': '\$12.99',
            'description':
                'Marinated in a rich blend of herbs and spices, then grilled to perfection, served with a side of zesty dipping sauce.',
          },
          {
            'url': 'assets/images/sec_snack.png',
            'name': 'Mexican appetizer',
            'rating': '5.0',
            'price': '\$15.00',
            'description': 'Tortilla Chips With Toppins',
          },
           {
            'url': 'assets/images/meal2.png',
            'name': 'Fresh Prawn Ceviche',
            'rating': '4.7',
            'price': '\$15.00',
            'description':
                'Shrimp marinated in zesty lime juice, mixed with crisp onions, tomatoes, and cilantro',
          },
          {
            'url': 'assets/images/burger.png',
            'name': 'Chicken Burger',
            'rating': '4.4',
            'price': '\$12.49',
            'description':
                'Tender grilled chicken breast, topped with crisp lettuce, ripe tomato, and creamy mayo, all nestled between a soft, toasted bun.',
          },
  ];
    return GridView.builder(
      shrinkWrap: true,
   //   physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        crossAxisCount: 2,
       childAspectRatio: 1.0,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
        ), 
        itemCount: recommendItemsList.length,
      itemBuilder: (context, index) {
        final list = recommendItemsList[index];
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(list['url'] as String))
          ),
         // child: Image(image: AssetImage(list['url'] as String)),
        );
        
      },);
  }
}