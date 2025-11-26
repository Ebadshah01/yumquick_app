import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yum_quick/utils/routes/route_name.dart';
import 'package:yum_quick/utils/routes/routes.dart';
import 'package:yum_quick/view/view_model/bottomnavbar_provider.dart';
import 'package:yum_quick/view/view_model/carousel_slider_provider.dart';
import 'package:yum_quick/view/view_model/food_category_model.dart';
import 'package:yum_quick/view/view_model/visiblity_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VisibilityModel()),
        ChangeNotifierProvider(create: (_) => FoodCategoryModel()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => CarouselSliderProvider()),
      ],
      child: ScreenUtilInit(
        designSize:  Size(375, 812),
         minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        child: MaterialApp(
          title: 'YUM Quick',
          theme: ThemeData(
          
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: RouteName.splash,
            // home: NavBarView(),
        ),
      ),
    );
  }
}


