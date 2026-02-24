import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_button.dart';
import 'package:book_store/core/custom_text.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // Controller Injection
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx((){
      final isDark = theme.isDark.value;
      return Scaffold(
      backgroundColor: isDark ? AppDarkColor.background : AppLightColor.background,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "Create Account",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                    ),
                    CustomText(
                      text: "Fill in your details to get started",
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Name Field
              CustomText(
                text: "Full Name",
                color: isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.nameController,
                hintText: "Enter your name",
                fillColor: Colors.transparent,
                textColor: isDark ? AppLightColor.primary : AppDarkColor.primary,
                suffixIcon: const Icon(Icons.person_outline, size: 20),
                borderSide: BorderSide(
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
              ),
              SizedBox(height: 8.h),

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
                textColor: isDark ? AppLightColor.primary : AppDarkColor.primary,
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
                textColor: isDark ? AppLightColor.primary : AppDarkColor.primary,
                suffixIcon: const Icon(Icons.lock_outline, size: 20),
                isPassword: true,
                borderSide: BorderSide(
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
              ),
              SizedBox(height: 8.h),

              // Confirm Password Field
              CustomText(
                text: "Confirm Password",
                color: isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.confirmPasswordController,
                hintText: "••••••••",
                fillColor: Colors.transparent,
                textColor: isDark ? AppLightColor.primary : AppDarkColor.primary,
                suffixIcon: const Icon(Icons.lock_reset_outlined, size: 20),
                isPassword: true,
                borderSide: BorderSide(
                    color: isDark
                        ? AppLightColor.primary
                        : AppDarkColor.primary,
                  ),
              ),

              SizedBox(height: 16.h),

              // Sign Up Button
              CustomButton(
                  text: "Sign Up",
                  backgroundColor: AppColor.green,
                  borderColor: Colors.transparent,
                  onTap: () {
                    Get.toNamed(AppRoutes.otpScreen, arguments: controller.emailController.text);
                  }
              ),

              SizedBox(height: 12.h),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomText(
                      text: "Or continue with",
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              SizedBox(height: 12.h),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account?",
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.loginInScreen),
                    child: CustomText(
                      text: "Log In",
                      fontSize: 14.sp,
                      color: AppColor.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
    });
  }
}
