import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/app_textfield.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBg(
        label: 'My Profile',
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.h.verticalSpace,
              Stack(
                children: [
                
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Hero(
                      tag: 'profile image',
                      child: Image(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV1hGOaznLG5xZaijiaxEbWxTUrtPJKADWSw&s',
                          
                        ),height: 120.h,
                        width: 120.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: themeSecondaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: themeWhiteColor,
                    ),
                  ).paddingOnly(top: 100.h, left: 100.w),
                ],
              ),
              10.h.verticalSpace,
              CustomTextField(label: 'Full Name', hint: 'Ebad Ali'),
              10.h.verticalSpace,

              CustomTextField(
                label: 'Date of Birth',
                hint: '19/07/2007',
                keyboardType: TextInputType.number,
              ),
              10.h.verticalSpace,

              CustomTextField(
                label: 'Email',
                hint: 'ebadshah@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              10.h.verticalSpace,

              CustomTextField(
                label: 'Phone Number',
                hint: '+92 3093125130',
                keyboardType: TextInputType.number,
              ),
              20.h.verticalSpace,
              CustomNavButton(
                title: 'Update Profile',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.navBarView,
                    (route) => false,
                  );
                },
                width: 150.w,
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
