import 'package:flutter/material.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/view/auth/login_view.dart';
import 'package:yum_quick/view/auth/signup_view.dart';
import 'package:yum_quick/view/home/home_view.dart';
import 'package:yum_quick/view/my_order/my_order_view.dart';
import 'package:yum_quick/view/nav_bar/nav_bar_view.dart';
import 'package:yum_quick/view/splash/on_boarding/on_boarding_view.dart';
import 'package:yum_quick/view/splash/splash_view.dart';
import 'package:yum_quick/view/splash/welcom_view.dart';

class Routes {
  static Route<MaterialPageRoute>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return pushTo(SplashView());
      case RouteName.welcome:
        return pushTo(WelcomView());
      case RouteName.logIn:
        return pushTo(LoginView());
      case RouteName.signUp:
        return pushTo(SignupView());
      case RouteName.homeView:
        return pushTo(HomeView());
      case RouteName.onBoarding:
        return pushTo(OnBoardingView());
      case RouteName.navBarView:
        return pushTo(NavBarView());
      case RouteName.myOrders:
        return pushTo(MyOrderView());

      default:
        pushTo(Scaffold(body: Center(child: Text('No Route Define'))));
    }
    return null;
  }

  static Route<MaterialPageRoute<dynamic>>? pushTo(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);
}
