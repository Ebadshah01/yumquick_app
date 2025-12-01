import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_quick/resources/app_assets.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          SvgPicture.asset(AppAssets.images.appLogg, color: themePrimaryColor),
          20.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YUM',
                style: context.headlineLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themePrimaryColor,
                ),
              ),
              Text(
                'QUICK',
                style: context.headlineLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeWhiteColor,
                ),
              ),
            ],
          ),
          20.h.verticalSpace,

          Text(
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod.',
            style: context.titleSmall.copyWith(color: themeWhiteColor),
            textAlign: TextAlign.center,
          ),
          30.h.verticalSpace,
          CustomNavButton(
            title: 'Log In',
            bgColor: themePrimaryColor,
            width: 150.w,
            titColor: themeSecondaryColor,
            onTap: () {
              Navigator.pushNamed(context, RouteName.logIn);
            },
          ),
          10.h.verticalSpace,
          CustomNavButton(
            title: 'Sign Up',
            bgColor: surfaceColor,
            width: 150.w,
            titColor: themeSecondaryColor,
            onTap: () {
              Navigator.pushNamed(context, RouteName.logIn);
            },
          ),
        ],
      ),
    );
  }
}
