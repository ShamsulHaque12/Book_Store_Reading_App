import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_icon.dart';
import 'package:book_store/app_themes/app_image.dart';
import 'package:book_store/features/my_home/controller/home_controller.dart';
import 'package:book_store/features/my_home/widget/book_card.dart';
import 'package:book_store/features/my_home/widget/image_text_card.dart';
import 'package:book_store/features/my_home/widget/section_header.dart';
import 'package:book_store/features/navigation_bar/controller/bottom_nav_controller.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:share_plus/share_plus.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    return Obx(() {
      final isDark = theme.isDark.value;

      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDark
              ? AppDarkColor.background
              : AppLightColor.background,

          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AppImage.logo, height: 100.h),
          ),

          title: Text(
            'Book Store',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.green,
            ),
          ),

          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: isDark
                    ? AppLightColor.background
                    : AppDarkColor.background,
              ),
              onPressed: theme.toggleTheme,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(AppIcon.notification, height: 35.h),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: "Free Books",
                  titleColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                  actionColor: AppColor.green,
                  onTap: () {
                    Get.toNamed(AppRoutes.seeAllDiscover);
                  },
                ),
                SizedBox(height: 12.h),
                Obx(() {
                  final totalItems = controller.modelData.length;
                  final showCount = totalItems >= 5
                      ? 5
                      : totalItems; // shudhu 5 ba kom thakle sob
                  return SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: showCount,
                      itemBuilder: (context, index) {
                        final item = controller.modelData[index];
                        return BookCard(
                          imageUrl: item.image,
                          title: item.title,
                          rate: item.rate,
                          price: item.price,
                          titleColor: isDark
                              ? AppLightColor.primary
                              : AppDarkColor.primary,
                          infoColor: AppColor.green,
                          onTap: () {
                            Get.toNamed(AppRoutes.freeBookDetailsView, arguments: item);
                          },
                          onMoreTap: () {
                            showBookActionSheet(
                              context: context,
                              onRemove: () {
                                controller.removeFromDiscover(index);
                              },
                              onShare: () {
                                print("Share tapped");
                                Share.share(item.title);
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 8.h),
                SectionHeader(
                  title: "Explore by Genre",
                  titleColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                  actionColor: AppColor.green,
                  onTap: () {
                    Get.toNamed(AppRoutes.exploreView);
                  },
                ),
                SizedBox(height: 12.h),
                Obx(() {
                  final totalItems = controller.genreModelData.length;
                  final showCount = totalItems >= 5
                      ? 5
                      : totalItems; // shudhu 5 ba kom thakle sob
                  return SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: showCount,
                      itemBuilder: (context, index) {
                        final item = controller.genreModelData[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: ImageTextCard(
                            imageUrl: item.image,
                            title: item.title,
                            onTap: () {
                              Get.toNamed(AppRoutes.allGenreBookView,arguments: {
                                "title":item.title
                              });
                            },
                          ),
                        );
                      },
                    ),
                  );
                }),

                SizedBox(height: 12.h),
                SectionHeader(
                  title: "On your wishlist",
                  titleColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                  actionColor: AppColor.green,
                  onTap: () {
                    final controller = Get.find<BottomNavController>();
                    controller.changeIndex(2);
                  },
                ),
                SizedBox(height: 12.h),
                Obx(() {
                  final totalItems = controller.favouriteData.length;
                  final showCount = totalItems >= 5 ? 5 : totalItems;
                  return SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: showCount,
                      itemBuilder: (context, index) {
                        final item = controller.favouriteData[index];
                        return BookCard(
                          imageUrl: item.image,
                          title: item.title,
                          rate: item.rate,
                          price: item.price,
                          titleColor: isDark
                              ? AppLightColor.primary
                              : AppDarkColor.primary,
                          infoColor: AppColor.green,
                          onTap: () {
                            print(item.title);
                            // Get.to(() => BookDetailsScreen());
                          },
                          onMoreTap: () {
                            showBookActionSheet(
                              context: context,
                              onRemove: () {
                                controller.removeFromFavourite(index);
                              },
                              onShare: () {
                                print("Share tapped");
                                Share.share(item.title);
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      );
    });
  }

  void showBookActionSheet({
    required BuildContext context,
    required VoidCallback onRemove,
    required VoidCallback onShare,
  }) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Remove'),
              onTap: () {
                Get.back();
                onRemove();
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.green),
              title: const Text('Share'),
              onTap: () {
                Get.back();
                onShare();
              },
            ),
          ],
        ),
      ),
    );
  }
}
