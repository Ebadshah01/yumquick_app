import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/generic_widget/discount_container_widget.dart';
import 'package:yum_quick/view/view_model/carousel_slider_provider.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key, required this.bestSellerList});

  final List<Map<String, String>> bestSellerList;

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselSliderProvider>(context);
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
                    child: Image.asset(bestItems['img']!, fit: BoxFit.fill),
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
                        bestItems['price']!,
                        style: context.titleMedium.copyWith(
                          color: themeWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(left: 20.w);
            },
          ),
        ),
        20.h.verticalSpace,
        DiscountContainer(carouselProvider: carouselProvider).paddingSymmetric(horizontal: 20.w),
      //   RecommendList()
             
      ],
    );
  }
}
