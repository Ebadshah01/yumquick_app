import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/extension/custom_padding.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/generic_widget/custom_bg.dart';
import 'package:yum_quick/view/generic_widget/custom_nav_button.dart';
import 'package:yum_quick/view/view_model/order_status_model.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final orderStatusModel = Provider.of<OrderStatusModel>(context);
    final orderStatus = [
      {
        'status': 'Active',
        'order': [
          {
            'imgUrl': 'assets/images/strawberry_shake.png',
            'title': 'Strawberry shake',
            'price': '\$20.00',
            'time': '29 Nov, 01:20 pm',
            'items': '2 items',
          },
        ],
      },
      {
        'status': 'Completed',
        'order': [
          {
            'imgUrl': 'assets/images/on_boarding2.png',
            'title': 'Chicken Curry',
            'price': '\$50.00',
            'time': '15 Nov, 15:20 pm',
            'items': '1 items',
          },
          {
            'imgUrl': 'assets/images/bestseller4.png',
            'title': 'Bean and Vegetable Burger',
            'price': '\$80.00',
            'time': '15 Nov, 15:20 pm',
            'items': '4 items',
          },
          {
            'imgUrl': 'assets/images/on_boarding3.png',
            'title': 'Bean and Vegetable Burger',
            'price': '\$80.00',
            'time': '15 Nov, 15:20 pm',
            'items': '4 items',
          },
        ],
      },
      {
        'status': 'Cancelled',
        'order': [
          {
            'imgUrl': 'assets/images/on_boarding.png',
            'title': 'Strawberry shake',
            'price': '\$20.00',
            'time': '29 Nov, 01:20 pm',
            'items': '2 items',
          },
          {
            'imgUrl': 'assets/images/strawberry_shake.png',
            'title': 'Strawberry shake',
            'price': '\$20.00',
            'time': '29 Nov, 01:20 pm',
            'items': '2 items',
          },
        ],
      },
    ];
    //    final List<Map<String,dynamic>> orderList;
    final currentOrders =
        orderStatus[orderStatusModel.selectedIndex]['order'] as List;

    return Scaffold(
      body: CustomBg(
        label: 'My Order',
        child: ListView(
          children: [
            Consumer<OrderStatusModel>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(orderStatus.length, (index) {
                    final status = orderStatus[index];
                    final isSelected = orderStatusModel.selectedIndex == index;
                    return Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: isSelected
                            ? themeSecondaryColor
                            // ignore: deprecated_member_use
                            : themeSecondaryColor.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Text(
                          status['status'] as String,
                          style: context.labelLarge.copyWith(
                            color: isSelected
                                ? themeWhiteColor
                                : themeSecondaryColor,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 6.h),
                    ).gestureDetector(
                      onTap: () {
                        value.selectedStatus(index);
                      },
                    );
                  }),
                );
              },
            ),

            10.h.verticalSpace,
            Divider(
              color: themeSecondaryColor,
              thickness: 0.5,
            ).paddingSymmetric(horizontal: 20.w),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentOrders.length,
              itemBuilder: (context, index) {
                final orders = currentOrders[index];

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: AssetImage(orders['imgUrl']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        10.w.horizontalSpace,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      orders['title'],
                                      style: context.titleLarge.copyWith(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  10.w.horizontalSpace,

                                  Text(
                                    orders['price'],
                                    style: context.titleMedium.copyWith(
                                      color: themeSecondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              5.h.verticalSpace,

                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      orders['time'],
                                      style: context.labelMedium.copyWith(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Text(
                                    orders['items'],
                                    style: context.labelMedium.copyWith(),
                                  ),
                                ],
                              ),
                              5.h.verticalSpace,
                              if (orderStatusModel.selectedIndex == 0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomNavButton(
                                      height: 25.h,
                                      labelSize: 13,
                                      title: 'Cancel Order',
                                      onTap: () {
                                        Navigator.pushNamed(context, RouteName.cancelView);
                                      },
                                    ),
                                    CustomNavButton(
                                      height: 25.h,
                                      labelSize: 13,
                                      title: 'Track Driver',
                                      onTap: () {},
                                      // ignore: deprecated_member_use
                                      bgColor: themeSecondaryColor.withOpacity(
                                        0.3,
                                      ),
                                      titColor: themeSecondaryColor,
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.done_all,
                                          color: themeSecondaryColor,
                                          size: 15.sp,
                                        ),
                                        Text(
                                          'Order Delivered',
                                          style: TextStyle(
                                            color: themeSecondaryColor,
                                            fontSize: 13.sp
                                          ),
                                        ),
                                      ],
                                    ),
                                    5.h.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomNavButton(
                                          height: 25.h,
                                          labelSize: 13,
                                          title: 'Leave a review',
                                          onTap: () {},
                                        ),
                                        CustomNavButton(
                                          height: 25.h,
                                          labelSize: 13,
                                          title: 'Order Again',
                                          onTap: () {},
                                          bgColor: themeSecondaryColor
                                              .withOpacity(0.3),
                                          titColor: themeSecondaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    5.h.verticalSpace,
                    Divider(color: themeSecondaryColor, thickness: 0.5),

                    10.h.verticalSpace,
                  ],
                );
              },
            ).paddingSymmetric(horizontal: 20.w),
          ],
        ),
      ),
    );
  }
}
