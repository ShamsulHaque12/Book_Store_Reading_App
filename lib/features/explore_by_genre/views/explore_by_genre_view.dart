import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/features/my_home/controller/home_controller.dart';
import 'package:book_store/features/my_home/widget/image_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExploreByGenreView extends StatelessWidget {
  ExploreByGenreView({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(title: 'Explore by Genre',titleColor: AppColor.green,),
        body: Padding(
          padding: EdgeInsets.all(12.w),
          child: GridView.builder(
            itemCount: controller.genreModelData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final item = controller.genreModelData[index];
              return ImageTextCard(
                imageUrl: item.image,
                title: item.title,
                onTap: () {
                  print("Item tapped: ${item.title}");
                },
              );
            },
          ),
        ),
      );
    });
  }
}
