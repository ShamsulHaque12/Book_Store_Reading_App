import 'package:book_store/auth_screen/forgot_password/screens/forgot_gmail_otp_screen.dart';
import 'package:book_store/auth_screen/forgot_password/screens/forgot_gmail_screen.dart';
import 'package:book_store/auth_screen/login_screen/screens/log_in_screen.dart';
import 'package:book_store/auth_screen/otp_screen/screens/otp_screen.dart';
import 'package:book_store/auth_screen/sign_up_screen/screens/sign_up_screen.dart';
import 'package:book_store/features/all_genre_books/views/all_genre_book_view.dart';
import 'package:book_store/features/book_details/views/book_details_view.dart';
import 'package:book_store/features/book_details/views/free_book_details_view.dart';
import 'package:book_store/features/explore_by_genre/views/explore_by_genre_view.dart';
import 'package:book_store/features/navigation_bar/bindings/bottom_nav_bindings.dart';
import 'package:book_store/features/navigation_bar/ui/screen/bottom_nav_screen.dart';
import 'package:book_store/features/see_all_free_book/views/see_all_discover_view.dart';
import 'package:book_store/features/top_categories/views/top_categories_view.dart';
import 'package:book_store/features/top_release_Books/views/top_relase_book.dart';
import 'package:book_store/features/top_selling/views/top_selling_views.dart';
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
    GetPage(name: AppRoutes.loginInScreen, page: () => LogInScreen()),
    GetPage(name: AppRoutes.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.forgotGmailScreen, page: () => ForgotGmailScreen()),
    GetPage(name: AppRoutes.forgotGmailOtpScreen, page: () => ForgotGmailOtpScreen()),
    GetPage(name: AppRoutes.otpScreen, page: () => OtpScreen()),





    GetPage(
      name: AppRoutes.bottomBar,
      page: () => BottomNavScreen(),
      binding: BottomNavBindings(),
    ),
    GetPage(name: AppRoutes.home, page: () => MyHomePage()),
    GetPage(name: AppRoutes.exploreView, page: () => ExploreByGenreView()),
    GetPage(name: AppRoutes.seeAllDiscover, page: () => SeeAllDiscoverView()),
    GetPage(name: AppRoutes.topCategoei, page: ()=> TopCategoriesView()),
    GetPage(name: AppRoutes.topSell, page: ()=> TopSellingViews()),
    GetPage(name: AppRoutes.topRelaseBook, page: ()=> TopRelaseBook()),
    GetPage(name: AppRoutes.allGenreBookView, page: ()=> AllGenreBookView()),
    GetPage(name: AppRoutes.bookDetailsView, page: ()=> BookDetailsView()),
    GetPage(name: AppRoutes.freeBookDetailsView, page: ()=> FreeBookDetailsView()),
  ];
}
