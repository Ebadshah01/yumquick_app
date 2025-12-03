
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_quick/resources/app_assets.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.h.verticalSpace,
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
                 Builder(
                  builder: (context) {
                    return Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: themeWhiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.icon.notifyIcon,
                      ).paddingAll(5),
                    ).inkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  },
                ),
             
                5.w.horizontalSpace,
                Builder(
                  builder: (context) {
                    return Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: themeWhiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.icon.profileIcon,
                      ).paddingAll(5),
                    ).inkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  },
                ),
              ],
            ),
            10.h.verticalSpace,
            Text(
              'Good Morning',
              style: context.headlineMedium.copyWith(
                color: themeWhiteColor,
              ),
            ),
            Text(
              "Rise and shine! It's breakfast time",
              style: context.labelMedium.copyWith(
                color: themeSecondaryColor,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
