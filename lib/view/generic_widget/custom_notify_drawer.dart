import 'package:flutter/material.dart';
import 'package:yum_quick/resources/theme/color_scheme.dart';

class CustomNotifyDrawer extends StatelessWidget {
  const CustomNotifyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
            backgroundColor: themeSecondaryColor,

    );
  }
}