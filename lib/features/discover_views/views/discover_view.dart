import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/discover_views/controller/discover_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    'Top Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppLightColor.primary
                          : AppDarkColor.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
