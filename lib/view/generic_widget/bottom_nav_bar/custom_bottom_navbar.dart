import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/generic_widget/bottom_nav_bar/nav_items_widget.dart';
import 'package:yum_quick/view/view_model/bottomnavbar_provider.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);

    return ClipRRect(
      
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

        child: Container(
        //  height: 50.h,
        //  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15).w,
          padding: const EdgeInsets.symmetric(vertical: 10).w,
          decoration: BoxDecoration(
            color: themeSecondaryColor,
            //  context.onPrimary.withOpacity(0.2),
          //  borderRadius: BorderRadius.circular(60.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
               // blurRadius: 20,
                spreadRadius: 10,
                // offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navProvider.items.length, (index) {
              // navProvider.currentIndex
              final isSelected = currentIndex == index;
              return NavItemWidget(
                icon: navProvider.items[index]['icon'] as IconData,
                label: navProvider.items[index]['label'] as String,
                isSelected: isSelected,
                onTap: () => onTap(index),
              );
            }),
          ),
        ).paddingOnly(bottom: 0.h),
      ),
    );
  }
}