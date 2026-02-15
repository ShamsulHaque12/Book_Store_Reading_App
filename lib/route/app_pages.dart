import 'package:book_store/features/explore_by_genre/views/explore_by_genre_view.dart';
import 'package:book_store/features/navigation_bar/bindings/bottom_nav_bindings.dart';
import 'package:book_store/features/navigation_bar/ui/screen/bottom_nav_screen.dart';
import 'package:book_store/features/see_all_recomanded/views/see_all_discover_view.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:book_store/splash_screen/views/splash_view.dart';
import 'package:get/get.dart';
import 'package:book_store/features/my_home/screens/my_home_page.dart';
import 'package:book_store/splash_screen/controller/splash_controller.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.bottomBar,
      page: () => BottomNavScreen(),
      binding: BottomNavBindings(),
    ),
    GetPage(name: AppRoutes.home, page: () => MyHomePage()),
    GetPage(name: AppRoutes.exploreView, page: () => ExploreByGenreView()),
    GetPage(name: AppRoutes.seeAllDiscover, page: () => SeeAllDiscoverView()),
  ];
}
