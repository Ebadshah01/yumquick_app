import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themeSecondaryColor,
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(radius: 25.r),
            title: Text(
              'Ebad Ali',
              style: context.headlineSmall.copyWith(
                fontWeight: FontWeight.bold,
                color: themeWhiteColor,
              ),
            ),
            subtitle: Text(
              'eali64695@gmail.com',
              style: context.titleSmall.copyWith(color: themeWhiteColor),
            ),
          ),
          20.h.verticalSpace,
          _drawerContent(Icons.shopping_bag_outlined, 'My Orders', () {
              Navigator.pushNamed(context, RouteName.myOrders);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'My Profile', () {
               Navigator.pushNamed(context, RouteName.profile);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'Delivery Address', () {
            //   Navigator.pushNamed(context, RouteName.);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'Payment Methods', () {
            //   Navigator.pushNamed(context, RouteName.);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'Contact Us', () {
            //   Navigator.pushNamed(context, RouteName.);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'Help & FAQs', () {
            //   Navigator.pushNamed(context, RouteName.);
          }, context: context),
          Divider(color: themeWhiteColor),
          _drawerContent(Icons.shopping_bag_outlined, 'Settings', () {
            //   Navigator.pushNamed(context, RouteName.);
          }, context: context),
          Divider(color: themeWhiteColor),
          20.h.verticalSpace,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: themeWhiteColor,
              ),
              child: Icon(
                Icons.logout,
                size: 25.sp,
                color: themeSecondaryColor,
              ).paddingAll(4),
            ),
            title: Text(
              'Log Out',
              style: context.titleLarge.copyWith(color: themeWhiteColor),
            ),
          ).gestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.logIn,
                (route) => false,
              );
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}

Widget _drawerContent(
  IconData icon,
  String title,
  VoidCallback onTap, {
  required BuildContext context,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: themeWhiteColor,
      ),
      child: Icon(icon, size: 25.sp, color: themeSecondaryColor).paddingAll(4),
    ),
    title: Text(
      title,
      style: context.titleLarge.copyWith(color: themeWhiteColor),
    ),
  ).gestureDetector(onTap: onTap);
}
