import 'package:book_store/core/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/favourite_views/controller/favourite_controller.dart';
import 'package:book_store/features/my_home/controller/home_controller.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({super.key});

  final FavouriteController favouriteController = Get.put(
    FavouriteController(),
  );

  final HomeController controller = Get.find<HomeController>();
  final ThemeController theme = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isDark = theme.isDark.value;

      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favourite",
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
                ),
                SizedBox(height: 16.h),

                /// 🔍 Search
                CustomTextField(
                  textEditingController: favouriteController.searchController,
                  hintText: 'Search Book',
                  fillColor: Colors.transparent,
                  borderSide: BorderSide(color: AppColor.green),
                  textColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                  prefixIcon: Icon(Icons.search, color: AppColor.green),
                ),

                SizedBox(height: 16.h),

                /// 📚 Favourite List
                Expanded(
                  child: Obx(() {
                    if (controller.favouriteData.isEmpty) {
                      return const Center(
                        child: Text('No favourite books found'),
                      );
                    }

                    return ListView.builder(
                      itemCount: controller.favouriteData.length,
                      itemBuilder: (context, index) {
                        final item = controller.favouriteData[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.network(
                                  item.image,
                                  width: 120.w,
                                  height: 150.h,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return SizedBox(
                                          width: 120.w,
                                          height: 150.h,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 80),
                                ),
                              ),

                              SizedBox(width: 16.w),

                              /// Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: AppColor.green,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      item.price,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: isDark
                                            ? AppLightColor.primary
                                            : AppDarkColor.primary,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "⭐ ${item.rate}",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// More Icon
                              IconButton(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showBookActionSheet(
                                    context: context,
                                    onRemove: () {
                                      controller.removeFromFavourite(index);
                                    },
                                    onShare: () {
                                      Share.share(
                                        '📚 ${item.title}\n💰 Price: ${item.price}',
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
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
