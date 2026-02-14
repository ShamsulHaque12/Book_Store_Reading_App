import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx((){
      final isDark = theme.isDark.value;
      return Scaffold(
      backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/reading.json',
              width: double.infinity,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30.h),
            Text(
              'Welcome to BookStore',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Your gateway to endless stories',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Discover, Read & Enjoy',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
    });
  }
}
