import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/app_textfield.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCategory = [
      {'icon': 'assets/icons/gmail.svg'},
      {'icon': 'assets/icons/facebook.svg'},
      {'icon': 'assets/icons/finger_print.svg'},
     
    ];
    return Scaffold(
      backgroundColor: themePrimaryColor,
      body: CustomBg(
        label: 'Log In',
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome', style: context.headlineSmall.copyWith()),
              10.h.verticalSpace,
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: context.bodySmall,
              ),
              40.h.verticalSpace,
              CustomTextField(label: 'Email', hint: 'xyz@gmail.com'),
              10.h.verticalSpace,
          
              CustomTextField(
                label: 'Password',
                hint: '*******',
             //   obscureText: true,
                isSuffixIcon: true,
              ),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Password',
                    style: context.labelMedium.copyWith(
                      color: themeSecondaryColor,
                    ),
                  ),
                ],
              ),
              40.h.verticalSpace,
              Center(
                child: CustomNavButton(
                  title: 'Log In',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.navBarView);
                  },
                  width: 150.w,
                ),
              ),
              20.h.verticalSpace,
              Center(
                child: Text(
                  'Or Sign up With',
                  style: context.labelLarge.copyWith(color: themeGreyColor),
                ),
              ),20.h.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  ...loginCategory.map((item) {
                    return Container(
                       height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      // ignore: deprecated_member_use
                      color: themeSecondaryColor.withOpacity(0.1)
                    ),
                      child: SvgPicture.asset(item['icon']!,).paddingAll(5));
                  }),
                ],
              ),
                20.h.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: context.labelLarge.copyWith(color: themeGreyColor),
                  ), Text(
                    "Sign Up",
                    style: context.labelLarge.copyWith(color: themeSecondaryColor),
                  ),
                ],
              ),
          
              // ...loginCategory.map((item) {
              //   return Image(image: AssetImage(item['icon'] as String),height: 40,width: 40,);
              // }).toList(),
            ],
          ).paddingAll(20),
        ),
      ),
    );
  }
}
