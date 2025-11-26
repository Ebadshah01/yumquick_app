import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yum_quick/resources/app_assets.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    
    
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteName.onBoarding);      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themePrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.images.appLogg,
            // ignore: deprecated_member_use
            color: themeSecondaryColor,
          ),
          10.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YUM',
                style: context.headlineLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeSecondaryColor,
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
          )
        ],
      ),
    );
  }
}
