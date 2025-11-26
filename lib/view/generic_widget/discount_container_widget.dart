
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_quick/resources/app_assets.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/view_model/carousel_slider_provider.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    super.key,
    required this.carouselProvider,
  });

  final CarouselSliderProvider carouselProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 130.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: themeSecondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                           Text(
                        'Experience our\ndelicious new dish',
                        style: context.labelLarge.copyWith(color: Colors.white),textAlign: TextAlign.center,
                      ),
                      5.h.verticalSpace,
                      Text(
                        '30% OFF',
                        style: context.headlineMedium.copyWith(
                          color: themeWhiteColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                 Positioned(
                        top: 0,
                        right: 0.w,
                        child: SvgPicture.asset(AppAssets.images.circularIcon)),
                 Positioned(
                        bottom: 0,
                        left: 0.w,
                        child: SvgPicture.asset(AppAssets.images.halfCircle)),
             
              ],
            ),
        
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                child: CarouselSlider.builder(
                  itemCount: carouselProvider.imgUrl.length,
                  itemBuilder: (context, index, realIndex) {
                    final images = carouselProvider.imgUrl[index];
                    return Image.asset(
                      images,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                  options: CarouselOptions(
                    height: 130.h,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      carouselProvider.updateIndex(index);
                      carouselProvider.notifyListeners(); 
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
           5.h.verticalSpace,

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children:List.generate(carouselProvider.imgUrl.length, (index)=> 
         AnimatedContainer(
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut,                     
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 4.h,
      width: carouselProvider.currentIndex == index ? 26.w : 20.w,
      decoration: BoxDecoration(
        color: carouselProvider.currentIndex == index
            ? themeSecondaryColor     
            // ignore: deprecated_member_use
            : themeSecondaryColor.withOpacity(0.2), 
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
)
      ],
    );
  }
}
