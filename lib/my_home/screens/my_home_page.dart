import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_icon.dart';
import 'package:book_store/app_themes/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    return Obx(() {
      final isDark = theme.isDark.value;

      return Scaffold(
        backgroundColor:
            isDark ? AppDarkColor.primary : AppLightColor.primary,

        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              isDark ? AppDarkColor.primary : AppLightColor.primary,

          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AppImage.logo, height: 100.h),
          ),

          title: Text(
            'Book Store',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color:AppColor.green,
            ),
          ),

          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color:
                    isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
              onPressed: theme.toggleTheme,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AppIcon.notification,
                height: 35.h,
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Discover',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color:
                    isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
            ),
          ),
        ),
      );
    });
  }
}
