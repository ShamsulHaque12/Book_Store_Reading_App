import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/features/language_screen/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageView extends StatelessWidget {
  LanguageView({super.key});
  
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    
    return Scaffold(
      body: Obx(() {
        final isDark = theme.isDark.value;
        return Scaffold(
          backgroundColor: isDark ? AppDarkColor.background : AppLightColor.background,
          appBar: CustomAppBar(title: 'Language', titleColor: AppColor.green),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: List.generate(controller.languages.length, (index) {
                return GestureDetector(
                  onTap: () => controller.changeLanguage(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.h),
                    decoration: BoxDecoration(
                      // Highlight the selected language
                      color: controller.languageIndex.value == index
                          ? AppColor.green.withOpacity(0.2) 
                          : (isDark ? Colors.grey[900] : Colors.grey[100]),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: controller.languageIndex.value == index 
                            ? AppColor.green 
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.languages[index],
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        // Checkmark for selected language
                        if (controller.languageIndex.value == index)
                          Icon(Icons.check_circle, color: AppColor.green, size: 20.sp),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}