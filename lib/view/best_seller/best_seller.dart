import 'package:flutter/material.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key, required this.foodCategories});
  final List<Map<String, dynamic>> foodCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBg(
        label: 'Best Seller',
        child: ListView(
          children: [
            Center(
              child: Text(
                'Discover our most popular dishes!',
                style: context.titleMedium.copyWith(color: themeSecondaryColor),
              ),
            ),
            // GridView.builder(
            //   shrinkWrap: true,
            //   itemCount: foodCategories.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //    // mainAxisExtent: 100,
            //     childAspectRatio: 1.0,
            //     crossAxisSpacing: 10,
              
            //   ),
            //   itemBuilder: (context, index) {
            //     final Map categories = foodCategories[index] as Map;
            //     return Container(
            //       height: 200.w,
            //       decoration: BoxDecoration(
            //         color: themeSecondaryColor
            //       ),
            //      // child: Text('data'),
            //       child: Image.asset(categories['images']['url']),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
