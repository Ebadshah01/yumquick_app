import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yum_quick/resources/extension/context_extension.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class NavItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0).w,

        decoration: BoxDecoration(
          color: themeSecondaryColor,
          borderRadius: BorderRadius.circular(30.r),
          border: isSelected
              ? Border.all(color: themeWhiteColor, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            Icon(icon,
             color: 
             //isSelected ? 
             themeWhiteColor 
           //  : context.onSurface
             ),
            if (isSelected) ...[
              Text(
                label,
                style: context.labelMedium.copyWith(color: themeWhiteColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
