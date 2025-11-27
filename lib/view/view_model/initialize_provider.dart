import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yum_quick/view/view_model/bottomnavbar_provider.dart';
import 'package:yum_quick/view/view_model/carousel_slider_provider.dart';
import 'package:yum_quick/view/view_model/food_category_model.dart';
import 'package:yum_quick/view/view_model/visiblity_model.dart';

class InitializeProvider {
  static List<SingleChildWidget> createChangeNotifierProvider = [
    ChangeNotifierProvider(create: (_) => VisibilityModel()),
    ChangeNotifierProvider(create: (_) => FoodCategoryModel()),
    ChangeNotifierProvider(create: (_) => BottomNavProvider()),
    ChangeNotifierProvider(create: (_) => CarouselSliderProvider()),
  ];
}
