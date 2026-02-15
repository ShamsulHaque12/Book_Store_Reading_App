import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_button.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
          title: 'Change Password',
          titleColor: AppColor.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Old Password',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: TextEditingController(),
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: Icon(Icons.lock, color: AppColor.green),
                isPassword: true,
              ),
              SizedBox(height: 16.h),

              /// New Password
              Text(
                'New Password',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: TextEditingController(),
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: Icon(Icons.lock, color: AppColor.green),
                isPassword: true,
              ),
              SizedBox(height: 16.h),

              /// Confirm Password
              Text(
                'Confirm Password',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: TextEditingController(),
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                prefixIcon: Icon(Icons.lock, color: AppColor.green),
                isPassword: true,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Save',
                onTap: () {},
                backgroundColor: AppColor.green,
              ),
            ],
          ),
        ),
      );
    });
  }
}
