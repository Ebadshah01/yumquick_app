import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/view/generic_widget/bottom_nav_bar/custom_bottom_navbar.dart';
import 'package:yum_quick/view/view_model/bottomnavbar_provider.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarViewModel = Provider.of<BottomNavProvider>(context);
    return Scaffold(
       body: navBarViewModel.views[navBarViewModel.currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onTap: navBarViewModel.changeIndex,
        currentIndex: navBarViewModel.currentIndex,
      ),
    );
  }
}