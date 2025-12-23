import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class CustomBg extends StatelessWidget {
  final double topContainerHeight;
  final double topContainerOverlap;
  final Widget child;
  final Widget? topRow;
  final String? label;
  final Color? menuContainer;
  final double? menuContainerHeight;
  final Widget? action;
  const CustomBg({
    super.key,
    this.topContainerHeight = 200,
    this.topContainerOverlap = 50,
    required this.child,
    this.topRow,
    this.label,
    this.menuContainer = themeWhiteColor,
    this.menuContainerHeight,
     this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: topContainerHeight.h,
          width: double.infinity,
          color: themePrimaryColor,
          child:
              topRow ??
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: themeSecondaryColor,
                  ).gestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
             //     SizedBox(width: 70.w),
                  Text(
                    label ?? '',
                    style: context.headlineLarge.copyWith(
                      fontSize: 24.sp,
                      color: themeWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  SizedBox(
                    child: action,
                  )

                ],
              ).paddingSymmetric(horizontal: 20.w),
        ),

        Container(
          height: menuContainerHeight ?? double.infinity,
          width: double.infinity,
          // padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: menuContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: child,
        ).paddingOnly(top: topContainerHeight - topContainerOverlap),
      ],
    );
  }
}
