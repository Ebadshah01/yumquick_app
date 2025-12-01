import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  final PageController _pageController = PageController();
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final List<Map<String, String>> _pages = [
    {  
      'icon' : 'assets/icons/onboardingicon1.svg',
      'image': 'assets/images/on_boarding.png',
      "title": "Order for Food",
      "description":
          "Master Arabic letters, words, and meanings\nat your own pace with guided lessons and\ninteractive exercises.",
    },
    {  
      'icon' : 'assets/icons/onboardingicon2.svg',
      'image': 'assets/images/on_boarding3.png',
      "title": "Easy Payment",
      "description":
          "Learn with fun and interactive activities\nspecially designed to strengthen your\nArabic language skills.",
    },
     {  
      'icon' : 'assets/icons/onboardingicon3.svg',
      'image': 'assets/images/on_boarding2.png',
      "title": "Fast Delivery",
      "description":
          "Learn with fun and interactive activities\nspecially designed to strengthen your\nArabic language skills.",
    },

  ];

  void _nextPage(BuildContext context) {
    if (selectedIndex.value == _pages.length - 1) {
      Navigator.pushReplacementNamed(context, RouteName.welcome);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBg(
        topContainerHeight: 500.h,

        topRow: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, index, _) {
            return Image.asset(
              _pages[index]['image'] ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
        ),

        child: Column(
          children: [
            SizedBox(height: 30.h),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  selectedIndex.value = index;
                },
                itemBuilder: (context, index) {
                  final item = _pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(item['icon'] as String),
                      10.h.verticalSpace,
                      Text(
                        item['title']!,
                        textAlign: TextAlign.center,
                        style:context.headlineSmall.copyWith(
                          color: themeSecondaryColor,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      15.h.verticalSpace,
                      Text(
                        item['description']!,
                        textAlign: TextAlign.center,
                        style: context.titleMedium
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 10.h),

            /// DOT INDICATOR
            ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (i) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 5.h,
                      width: index == i ? 25.w : 20.w,
                      decoration: BoxDecoration(
                        color: index == i
                            ? themeSecondaryColor
                            // ignore: deprecated_member_use
                            : themeSecondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                );
              },
            ),

            25.h.verticalSpace,

            GestureDetector(
              onTap: () => _nextPage(context),
              child: Container(
                height: 40.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: themeSecondaryColor, 
                ),
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: selectedIndex,
                  builder: (context, index, _) {
                    return Text(
                      index == _pages.length - 1 ? "Get Started" : "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),

            30.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
