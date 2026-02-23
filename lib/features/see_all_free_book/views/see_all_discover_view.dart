import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/my_home/controller/home_controller.dart';
import 'package:book_store/features/my_home/widget/book_card.dart';
import 'package:book_store/features/see_all_free_book/controller/see_all_recomanded_controller.dart';

class SeeAllDiscoverView extends StatelessWidget {
  SeeAllDiscoverView({super.key});

  final SeeAllRecomandedController seeAllRecomandedController =
      Get.put(SeeAllRecomandedController());

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    return Obx(() {
      final isDark = theme.isDark.value;

      return Scaffold(
        backgroundColor:
            isDark ? AppDarkColor.background : AppLightColor.background,

        appBar: CustomAppBar(
          title: 'See All Free Books',
          titleColor: AppColor.green,
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              /// 🔍 Search
              CustomTextField(
                textEditingController:
                    seeAllRecomandedController.searchController,
                hintText: 'Search Book',
                fillColor: Colors.transparent,
                borderSide: BorderSide(
                  color: AppColor.green
                ),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: Icon(Icons.search, color: AppColor.green),
              ),

              SizedBox(height: 16.h),

              /// 📚 Books Grid
              Expanded(
                child: Obx(() {
                  return GridView.builder(
                    itemCount: controller.modelData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 3 / 4,
                    ),
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
                              Share.share(
                                '📚 ${item.title}\n💰 Price: ${item.price}',
                              );
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

  /// 🔽 Bottom Sheet
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
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
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
