import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';
import 'package:yum_quick/view/items_details_screen/widget/quantity_widget.dart';
import 'package:yum_quick/view/view_model/favorite_items.dart';
import 'package:yum_quick/view/view_model/item_quantity_model.dart';

class CategoryItemsDetails extends StatelessWidget {
  final Map<String, dynamic> items;

  const CategoryItemsDetails({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    final favoriteItems = Provider.of<FavoriteItems>(context);
    final quantityModel = Provider.of<ItemQuantityModel>(context);
    quantityModel.setPrice(items['price']); 
    return Scaffold(
      body: CustomBg(
        //       action: Icon(Icons.favorite_outline_rounded,color: themeSecondaryColor,),
        action: GestureDetector(
          onTap: () {
            if (favoriteItems.isFavorite(items)) {
              favoriteItems.removeItem(items);
            } else {
              favoriteItems.addItem(items);
            }
          },
          child: Container(
            height: 30.h,
            width: 30.w,

            decoration: BoxDecoration(
              color: themeSecondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                favoriteItems.isFavorite(items)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: themeWhiteColor,
              ),
            ),
          ),
        ),

        label: items['name'],
        child: ListView(
          children: [
            Hero(tag: items['url'], child: Image.asset(items['url'])),
            10.h.verticalSpace,
             Divider(
              color: themeSecondaryColor,
              // thickness: 1,
            ),
            5.h.verticalSpace,
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( 
                //  "\$${items['price'].toString()}",
                "\$${quantityModel.totalPrice.toStringAsFixed(2)}",
                  style: context.titleLarge.copyWith(
                    color: themeSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                QuantityWidget(),
              ],
            ),            5.h.verticalSpace,

            Divider(
              color: themeSecondaryColor,
              // thickness: 1,
            ),
            10.h.verticalSpace,
            Text(items['name'], style: context.titleLarge),

            Text(items['description'], style: context.titleSmall),
            40.h.verticalSpace,
            CustomNavButton(
              title: '   Add to Cart',
              onTap: () {},
              isIcon: true,
             icon: Icons.shopping_bag_outlined,
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
