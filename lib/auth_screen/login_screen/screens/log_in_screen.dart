import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_button.dart';
import 'package:book_store/core/custom_text.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../forgot_password/screens/forgot_gmail_screen.dart';
import '../controller/log_in_controller.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final LogInController controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Section
                Center(
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/5087/5087579.png",
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 16.h),

                // Title Section
                CustomText(
                  text: "Welcome Back!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
                CustomText(
                  text: "Login to your existing account",
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
                SizedBox(height: 16.h),

                // Email Field
                CustomText(
                  text: "Email Address",
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  textEditingController: controller.emailController,
                  hintText: "example@gmail.com",
                  fillColor: Colors.transparent,
                  textColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                  suffixIcon: const Icon(Icons.email_outlined, size: 20),
                  borderSide: BorderSide(
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
                ),
                SizedBox(height: 8.h),

                // Password Field
                CustomText(
                  text: "Password",
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  textEditingController: controller.passwordController,
                  hintText: "••••••••",
                  fillColor: Colors.transparent,
                  textColor: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,

                  suffixIcon: const Icon(Icons.lock_outline, size: 20),
                  isPassword: true,
                  borderSide: BorderSide(
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
                ),
                SizedBox(height: 8.h),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "Forgot Password?",
                    onTap: () {
                      Get.to(() => ForgotGmailScreen());
                    },
                    fontSize: 13.sp,
                    color: AppColor.green,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: "Log In",
                  backgroundColor: AppColor.green,
                  borderColor: Colors.transparent,
                  onTap: () {
                    Get.toNamed(AppRoutes.bottomBar);
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomText(
                        text: "Or continue with",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 16.h),

                // Google Login Button
                CustomButton(
                  text: "Sign in with Google",
                  onTap: () {},
                  backgroundColor: AppColor.green,
                  textColor: Colors.black87,
                  borderColor: Colors.transparent,
                  borderWidth: 1,
                  prefixIcon: Image.network(
                    "https://play-lh.googleusercontent.com/NN8G4Xc03GSv2_Tu-icuoeOwSo1xoZ4ouzUl24fVlwm5OeIAo7gV0zS1dVRWgCay-BU=w600-h300-pc0xffffff-pd",
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 16.h),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: "Sign Up",
                      fontSize: 14.sp,
                      color: AppColor.green,
                      fontWeight: FontWeight.w400,
                      onTap: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
