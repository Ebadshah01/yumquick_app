import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class CustomNavButton extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final Color? titColor;
  final double? height;
  final double? width;
  final double? labelSize;
  final VoidCallback onTap;
  final bool isIcon;
  final IconData? icon;
  final double horizontal;
  final double vertical;

  const CustomNavButton({
    super.key,
    this.bgColor = themeSecondaryColor,
    required this.title,
    this.titColor = themeWhiteColor,
    this.height,
    this.width,
    required this.onTap,
    this.labelSize,
    this.isIcon = false,
    this.icon,
    this.horizontal = 20,
    this.vertical=5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: bgColor,
      ),
      child: Row(crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon ?
         Icon(icon, size: 25.sp, color: themeWhiteColor) : Text(''),
        //  10.w.horizontalSpace,
          Center(
            child: Text(
              title,
              style: context.titleMedium.copyWith(
                color: titColor,
                fontSize: labelSize,
              ),
            ),
          ),
        ],
      ),
    ).gestureDetector(onTap: onTap);
  }
}
