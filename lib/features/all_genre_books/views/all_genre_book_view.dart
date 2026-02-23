import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AllGenreBookView extends StatelessWidget {
  const AllGenreBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    // 👇 argument receive
    final args = Get.arguments as Map<String, dynamic>?;
    final String title = args?['title'] ?? '';

    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(
          title: 'All Genre Books',
          titleColor: AppColor.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Show All",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                    ),
                  ),
                  Spacer(),
                  
                ],
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
