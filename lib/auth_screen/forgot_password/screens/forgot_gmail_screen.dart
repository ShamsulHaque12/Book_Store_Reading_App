import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/auth_screen/forgot_password/controller/forgot_password_controller.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_button.dart';
import 'package:book_store/core/custom_text.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ForgotGmailScreen extends StatelessWidget {
  ForgotGmailScreen({super.key});
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text: "Forgot Password",
                  fontSize: 24.sp,
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: CustomText(
                  text:
                      "Enter your registered email address. We’ll send a 6-digit verification code to reset your password.",
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 22.h),
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
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                ),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: "Continue",
                backgroundColor: AppColor.green,
                borderColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.forgotGmailOtpScreen,
                    arguments: controller.emailController.text,
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
