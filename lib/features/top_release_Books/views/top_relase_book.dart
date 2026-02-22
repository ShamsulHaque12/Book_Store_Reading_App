import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/discover_views/controller/discover_controller.dart';
import 'package:book_store/features/my_home/widget/book_card.dart';
import 'package:book_store/features/top_release_Books/controller/top_release_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:share_plus/share_plus.dart';

class TopRelaseBook extends StatelessWidget {
  TopRelaseBook({super.key});
  final TopReleaseController topReleaseController = Get.put(
    TopReleaseController(),
  );
  final DiscoverController controller = Get.find<DiscoverController>();

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
          title: 'Top Release Books',
          titleColor: AppColor.green,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              /// 🔍 Search
              CustomTextField(
                textEditingController: topReleaseController.searchController,
                hintText: 'Search Book',
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: const Icon(Icons.search, color: AppColor.green),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Obx(() {
                  return GridView.builder(
                    itemCount: controller.topRelease.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 3 / 4,
                    ),
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
                  );
                }),
              ),
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
