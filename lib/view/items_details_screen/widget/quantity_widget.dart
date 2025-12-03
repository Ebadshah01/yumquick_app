import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/extension/custom_inkwell.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/view_model/item_quantity_model.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<ItemQuantityModel>(context);
    return Row(
      children: [
        _quantityContainer(
          context,
          '-',
          () {
            quantityProvider.decrease();
          },
          themeSecondaryColor.withOpacity(0.4),
        ),10.w.horizontalSpace,
        Text(quantityProvider.quantity.toString(),style: context.titleLarge,),
        10.w.horizontalSpace,
         _quantityContainer(
          context,
          '+',
          () {
            quantityProvider.increase();
          },
          themeSecondaryColor,
        ),
      ],
    );
  }
}

Widget _quantityContainer(
  BuildContext context,
  String icon,
  VoidCallback onTap,
  Color color,
) {
  return Container(
    height:25.h,
    width:25.w,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    child: Center(
      child: Text(icon, style: TextStyle(color: themeWhiteColor,fontSize: 17.sp)),
    ),
  ).inkWell(onTap: onTap);
}
