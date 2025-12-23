import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/best_seller/best_seller.dart';
import 'package:yum_quick/view/generic_widget/discount_container_widget.dart';
import 'package:yum_quick/view/items_details_screen/items_details_screen.dart';
import 'package:yum_quick/view/view_model/carousel_slider_provider.dart';

class DashboardContent extends StatelessWidget {
  final List<Map<String,dynamic>> foodCategory;
  const DashboardContent({super.key, required this.bestSellerList, required this.foodCategory});

  final List<Map<String, dynamic>> bestSellerList;

  @override
  Widget build(BuildContext context) {
    // final carouselProvider = Provider.of<CarouselSliderProvider>(context);
  //  print('object');
    return Column(
      children: [
        Divider(color: themeSecondaryColor),
        10.h.verticalSpace,
        Row(
          children: [
            Text(
              'Best Seller',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'View All',
                    style: context.bodyMedium.copyWith(color: themeSecondaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: themeSecondaryColor,
                    size: 15.sp,
                  ),
                ],
              ).inkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BestSeller(foodCategories:foodCategory,)));
              }),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
        10.h.verticalSpace,
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bestSellerList.length,
            itemBuilder: (context, index) {
              final bestItems = bestSellerList[index];
              return Stack(
                children: [
                  Container(
                    height: 110.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),

                      // image: DecorationImage(
                      //   image: AssetImage(bestItems['img']!),
                      // ),
                    ),
                    child: Hero(
                      tag:  bestItems['img']!, 
                      child: Image.asset(bestItems['img']!, fit: BoxFit.fill)),
                  ).gestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemsDetailsScreen(item: bestItems)
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    bottom: 15.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeSecondaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Text(
                        "\$${bestItems['price'].toString()}",
                        style: context.titleSmall.copyWith(
                          color: themeWhiteColor,
                        ),
                      ).paddingAll(4),
                    ),
                  ),
                ],
              ).paddingOnly(left: 15.w);
            },
          ),
        ),
        20.h.verticalSpace,
        Consumer<CarouselSliderProvider>(
          builder: (context, vm, _) {
            return DiscountContainer(
              carouselProvider: vm,
            ).paddingSymmetric(horizontal: 20.w);
          }
        ),

        //  RecommendList()
      ],
    );
  }
}
