import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_image.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/core/custom_button.dart';
import 'package:book_store/core/custom_text_field.dart';
import 'package:book_store/features/edit_profile/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(title: 'Edit Profile', titleColor: AppColor.green),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.green, width: 2.w),
                      ),
                      child: ClipOval(
                        child: Image.asset(AppImage.logo, fit: BoxFit.contain),
                      ),
                    ),

                    /// 🔹 Edit Icon
                    GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.green,
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Name
              SizedBox(height: 16.h),
              Text(
                'Full Name',
                style: GoogleFonts.poppins(
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.nameController,
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
              ),

              /// Email
              SizedBox(height: 12.h),
              Text(
                'Email',
                style: GoogleFonts.poppins(
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.emailController,
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
              ),

              /// Password
              SizedBox(height: 12.h),
              Text(
                'Phone Number',
                style: GoogleFonts.poppins(
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.phoneController,
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
              ),

              /// Date of Birth
              SizedBox(height: 12.h),
              Text(
                'Date of Birth',
                style: GoogleFonts.poppins(
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.dateController,
                readOnly: true,
                fillColor: Colors.transparent,
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.day.toString().padLeft(2, '0')}-"
                        "${pickedDate.month.toString().padLeft(2, '0')}-"
                        "${pickedDate.year}";
                    controller.dateController.text = formattedDate;
                  }
                },
                borderSide: BorderSide(color: AppColor.green),
              ),

              /// Address
              SizedBox(height: 12.h),
              Text(
                'Address',
                style: GoogleFonts.poppins(
                  color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.addressController,
                fillColor: Colors.transparent,
                borderSide: BorderSide(color: AppColor.green),
                textColor: isDark
                    ? AppLightColor.primary
                    : AppDarkColor.primary,
              ),

              /// Save Button
              SizedBox(height: 16.h),
              CustomButton(
                onTap: () {},
                text: 'Save',
                backgroundColor: AppColor.green,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      );
    });
  }
}
