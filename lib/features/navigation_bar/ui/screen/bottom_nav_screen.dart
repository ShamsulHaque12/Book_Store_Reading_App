
import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_icon.dart';
import 'package:book_store/features/account_views/views/account_view.dart';
import 'package:book_store/features/discover_views/views/discover_view.dart';
import 'package:book_store/features/favourite_views/views/favourite_view.dart';
import 'package:book_store/features/my_home/screens/my_home_page.dart';
import 'package:book_store/features/navigation_bar/controller/bottom_nav_controller.dart';
import 'package:book_store/features/purchased_view/views/purchased_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    final theme = Get.find<ThemeController>();

    final List<Widget> screens = [
      MyHomePage(),
      DiscoverView(),
      FavouriteView(),
      PurchasedView(),
      AccountView(),
    ];

    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        final isDarkMode = theme.isDark.value;

        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDarkMode
              ? AppDarkColor.background
              : AppLightColor.background,
          selectedItemColor: AppColor.green,
          unselectedItemColor: isDarkMode
              ? Colors.white
              : const Color(0xff212529),
          selectedFontSize: 12,
          unselectedFontSize: 0,
          showUnselectedLabels: false,
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcon.home,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 0
                      ? AppColor.green
                      : isDarkMode
                      ? Colors.white
                      : const Color(0xff212529),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcon.discover,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 1
                      ? AppColor.green
                      : isDarkMode
                      ? Colors.white
                      : const Color(0xff212529),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcon.favourite,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 2
                      ? AppColor.green
                      : isDarkMode
                      ? Colors.white
                      : const Color(0xff212529),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcon.purchased,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 3
                      ? AppColor.green
                      : isDarkMode
                      ? Colors.white
                      : const Color(0xff212529),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Purchased',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcon.account,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 4
                      ? AppColor.green
                      : isDarkMode
                      ? Colors.white
                      : const Color(0xff212529),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Account',
            ),
          ],
        );
      }),
    );
  }
}
