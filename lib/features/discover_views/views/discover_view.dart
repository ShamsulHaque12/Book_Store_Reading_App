import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/discover_views/controller/discover_controller.dart';
import 'package:book_store/features/my_home/widget/book_card.dart';
import 'package:book_store/features/my_home/widget/section_header.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';

class DiscoverView extends StatelessWidget {
  DiscoverView({super.key});

  final DiscoverController controller = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    return Obx(() {
      final isDark = theme.isDark.value;

      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(
          title: 'Discover',
          titleColor: AppColor.green,
          showBack: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔍 Search
              CustomTextField(
                textEditingController: controller.searchController,
                hintText: 'Search Book',
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: Icon(Icons.search, color: AppColor.green),
              ),

              SizedBox(height: 12.h),

              SectionHeader(
                title: "Top Categories",
                titleColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                actionColor: AppColor.green,
                onTap: () {
                  Get.toNamed(AppRoutes.topCategoei);
                },
              ),

              SizedBox(height: 8.h),

              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.topCategories.length > 5
                      ? 5
                      : controller.topCategories.length,
                  itemBuilder: (context, index) {
                    final item = controller.topCategories[index];
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
                      },
                      onMoreTap: () {
                        showBookActionSheet(
                          context: context,
                          onRemove: () {
                            controller.removeTopCategories(index);
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
              ),
              SizedBox(height: 12.h),
              SectionHeader(
                title: "Top Sellings",
                titleColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                actionColor: AppColor.green,
                onTap: () {
                  Get.toNamed(AppRoutes.topSell);
                },
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.topSell.length > 5
                      ? 5
                      : controller.topSell.length,
                  itemBuilder: (context, index) {
                    final item = controller.topSell[index];
                    return BookCard(
                      imageUrl: item.image,
                      title: item.title,
                      rate: item.rate,
                      price: item.price,
                      titleColor: isDark
                          ? AppLightColor.primary
                          : AppDarkColor.primary,
                      infoColor: AppColor.green,
                      onTap: () {},
                      onMoreTap: () {
                        showBookActionSheet(
                          context: context,
                          onRemove: () {
                            controller.removeTopSell(index);
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
              ),
              SizedBox(height: 12.h),
              SectionHeader(
                title: "Top New Releases",
                titleColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                actionColor: AppColor.green,
                onTap: () {
                  Get.toNamed(AppRoutes.topRelaseBook);
                },
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.topRelease.length > 5
                      ? 5
                      : controller.topRelease.length,
                  itemBuilder: (context, index) {
                    final item = controller.topRelease[index];
                    return BookCard(
                      imageUrl: item.image,
                      title: item.title,
                      rate: item.rate,
                      price: item.price,
                      titleColor: isDark
                          ? AppLightColor.primary
                          : AppDarkColor.primary,
                      infoColor: AppColor.green,
                      onTap: () {},
                      onMoreTap: () {
                        showBookActionSheet(
                          context: context,
                          onRemove: () {
                            controller.removeTopRelease(index);
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
              ),
              SizedBox(height: 20.h),
            ],
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
