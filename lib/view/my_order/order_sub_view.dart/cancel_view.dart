import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/app_textfield.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';
import 'package:yum_quick/view/view_model/cancel_reason_model.dart';

class CancelView extends StatelessWidget {
  const CancelView({super.key});

  @override
  Widget build(BuildContext context) {
    final complainsList = [
      {'title': 'Lorem ipsum dolor sit amet'},
      {'title': 'Lorem ipsum dolor sit amet'},
      {'title': 'Lorem ipsum dolor sit amet'},
      {'title': 'Lorem ipsum dolor sit amet'},
    ];
    final reasonProvider = Provider.of<CancelReasonModel>(context);
    return Scaffold(
      body: CustomBg(
        label: 'Cancel Order',
        child: ListView(
          children: [
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor.',
              style: context.titleSmall,
            ),
            20.h.verticalSpace,
            Divider(color: themeSecondaryColor, thickness: 0.8),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: complainsList.length,
              itemBuilder: (context, index) {
                final reasons = complainsList[index];
                final isSelected = reasonProvider.selectedIndex == index;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        reasonProvider.selectReason(index);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            reasons['title'] as String,
                            style: context.titleMedium,
                          ).paddingSymmetric(vertical: 10.h),
                          Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: themeSecondaryColor),
                            ),
                            child: Center(
                              child: Container(
                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: themeSecondaryColor),
                                  color: isSelected
                                      ? themeSecondaryColor
                                      : themeWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: themeSecondaryColor, thickness: 0.8),
                  ],
                );
              },
            ),
            20.h.verticalSpace,

            CustomTextField(label: 'Others', maxLines: 3),
            40.h.verticalSpace,
            Center(
              child: CustomNavButton(title: 'Submit', onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, RouteName.navBarView,(route) => false);
              }, width: 100),
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
