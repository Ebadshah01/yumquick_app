import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/app_assets.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/home/widget/category_item.dart';
import 'package:yum_quick/view/home/widget/dashboard_content.dart';
import 'package:yum_quick/view/home/widget/food_category_row.dart';
import 'package:yum_quick/view/view_model/food_category_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final foodCategoryModel = Provider.of<FoodCategoryModel>(context);
    final foodCategory = [
      {
        'icon': 'assets/icons/snacks.svg',
        'title': 'Snacks',
        'images': [
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
        ],
      },

      {
        'icon': 'assets/icons/meals.svg',
        'title': 'Meals',
        'images': [
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
        ],
      },

      {
        'icon': 'assets/icons/vegan.svg',
        'title': 'Vegan',
        'images': [
          {
            'url': 'assets/images/vegan2.png',
            'name': 'mushroom risotto',
            'rating': '5.0',
            'price': '\$15.00',
            'description':
                'Creamy mushroom risotto, cooked to perfection with arborio rice, wild mushrooms, Parmesan cheese, and white wine.',
          },
          {
            'url': 'assets/images/vegan.png',
            'name': 'broccoli lasagna',
            'rating': '4.0',
            'price': '\$12.99',
            'description':
                'Tender broccoli florets, creamy ricotta cheese, savory marinara sauce, and topped with melted mozzarella.',
          },
        ],
      },

      {
        'icon': 'assets/icons/desserts.svg',
        'title': 'Dessert',
        'images': [
          {
            'url': 'assets/images/desert2.png',
            'name': 'chocolate brownie',
            'rating': '5.0',
            'price': '\$15.00',
            'description':
                'premium cocoa, melted chocolate, and a hint of vanilla, creating a moist, fudgy center with a crisp, crackly top.',
          },
          {
            'url': 'assets/images/desert.png',
            'name': 'macarons',
            'rating': '5.0',
            'price': '\$12.99',
            'description':
                'Delicate vanilla and chocolate macarons, featuring a crisp outer shell and a smooth.',
          },
        ],
      },
    ];

    final bestSellerList = [
      {'price': '\$20.4', 'img': 'assets/images/bestseller2.svg'},
      {'price': '\$50.0', 'img': 'assets/images/bestseller3.png'},
      {'price': '\$12.3', 'img': 'assets/images/bestseller4.png'},
      {'price': '\$99.9', 'img': 'assets/images/bestseller1.svg'},
    ];
    

    return Scaffold(
      body: CustomBg(
        // menuContainerHeight: 200,
        menuContainer: foodCategoryModel.selectedIndex == -1
            ? themeWhiteColor
            : themeSecondaryColor,
        //  topContainerHeight: 200.h,
        topRow: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: themeWhiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.format_list_bulleted_sharp,
                          color: themeSecondaryColor,
                        ),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  6.h.verticalSpace,

                  SizedBox(width: 20.w),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: themeWhiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.icon.shoppingIcon,
                    ).paddingAll(5),
                  ),
                  5.w.horizontalSpace,
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: themeWhiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.icon.notifyIcon,
                    ).paddingAll(5),
                  ),
                  5.w.horizontalSpace,
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: themeWhiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.icon.profileIcon,
                    ).paddingAll(5),
                  ),
                ],
              ),
              10.h.verticalSpace,
              Text(
                'Good Morning',
                style: context.headlineMedium.copyWith(color: themeWhiteColor),
              ),
              Text(
                "Rise and shine! It's breakfast time",
                style: context.labelMedium.copyWith(color: themeSecondaryColor),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        child: Column(
          children: [
            FoodCategoryRow(
              foodCategory: foodCategory,
            ).paddingOnly(top: 20.h, left: 20.w, right: 20.w),
            foodCategoryModel.selectedIndex == -1
                ? DashboardContent(bestSellerList: bestSellerList).paddingSymmetric(horizontal: 20.w)
                : Expanded(
                    child: CategoryItems(
                      foodCategory: foodCategory,
                      foodCategoryModel: foodCategoryModel,
                    ),
                  ),

            // 10.h.verticalSpace,
            //  Divider(color: themeSecondaryColor),
          ],
        ),
      ),
    );
  }
}
