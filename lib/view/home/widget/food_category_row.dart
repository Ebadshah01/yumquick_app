
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/view_model/food_category_model.dart';

class FoodCategoryRow extends StatelessWidget {
  const FoodCategoryRow({
    super.key,
    required this.foodCategory,
  });

  final List<Map<String, dynamic>> foodCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Consumer<FoodCategoryModel>(
        builder: (context, value, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            
            shrinkWrap: true,
            primary: false,
            itemCount: foodCategory.length,
            itemBuilder: (context, index) {
              final category = foodCategory[index];
              final bool isSelected = value.selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  value.selectedCategory(index);
                },
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? themeWhiteColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25 .r),
                      topRight: Radius.circular(25 .r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          // ignore: deprecated_member_use
                          color: isSelected
                              ? themePrimaryColor.withOpacity(0.8)
                              : Color(0xffF3E9B5),
                        ),
                        child: SvgPicture.asset(
                          category['icon']!,
                        ).paddingAll(10),
                      ),
                      Text(
                        category['title']!,
                        style: context.bodyMedium,
                      ),
                    ],
                  ),
                ).paddingOnly( left: 10.w),
              );
            },
          );
        },
      ),
    );
  }
}
