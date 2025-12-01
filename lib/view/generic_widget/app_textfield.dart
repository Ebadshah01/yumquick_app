import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';
import 'package:yum_quick/view/view_model/visiblity_model.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  // final bool obscureText;
  final bool isSuffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.keyboardType = TextInputType.text,
    //  this.obscureText = false,
    this.isSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final visibility = Provider.of<VisibilityModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.titleMedium),

        6.h.verticalSpace,

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,

              obscureText: isSuffixIcon ? visibility.obscureText : false,
          decoration: InputDecoration(
            suffixIcon: isSuffixIcon
                ? GestureDetector(
                  onTap: () => visibility.toggle(),
                  child: Icon(
                    visibility.obscureText
                    ?
                    Icons.visibility_off
                    :Icons.visibility
                    , color: themeSecondaryColor))
                : null,
            hintText: hint,
            // ignore: deprecated_member_use
            hintStyle: TextStyle(color: themeBlackColor.withOpacity(0.6)),
            filled: true,
            // ignore: deprecated_member_use
            fillColor: themePrimaryColor.withOpacity(0.3),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
