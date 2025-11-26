
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/view_model/food_category_model.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.foodCategory,
    required this.foodCategoryModel,
  });

  final List<Map<String, dynamic>> foodCategory;
  final FoodCategoryModel foodCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:
                  (foodCategory[foodCategoryModel
                              .selectedIndex]['images']
                          as List)
                      .length,
              itemBuilder: (context, index) {
                final List images =
                    foodCategory[foodCategoryModel
                            .selectedIndex]['images']
                        as List;
                final Map imgData = images[index] as Map;
    
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            imgData['url'],
                          ), // ← ONLY IMAGE
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          imgData['name'],
                          style: context.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.w.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ),
                            color: themeSecondaryColor,
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                imgData['rating'],
                                style: context.titleSmall
                                    .copyWith(
                                      color: themeWhiteColor,
                                    ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15.sp,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 5.w),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            imgData['price'],
                            style: context.titleMedium.copyWith(
                              color: themeSecondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      imgData['description'],
                      style: context.titleSmall.copyWith(
                        // color: themeGreyColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Divider(color: themeSecondaryColor,),
                    10.h.verticalSpace,
                  ],
                );
              },
            ),
          ),
        ],
      ).paddingOnly(left: 20.w, right: 20.w, top: 20.h),
    );
  }
}
