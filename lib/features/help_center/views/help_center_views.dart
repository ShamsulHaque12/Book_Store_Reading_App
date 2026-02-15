import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/features/help_center/controller/help_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterViews extends StatelessWidget {
  HelpCenterViews({super.key});
  final HelpCenterController controller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    
    return Obx(() {
      final isDark = theme.isDark.value;
      final cardColor = isDark ? Colors.grey[900] : Colors.white;
      final textColor = isDark ? Colors.white : Colors.black87;

      return Scaffold(
        backgroundColor: isDark ? AppDarkColor.background : AppLightColor.background,
        appBar: CustomAppBar(title: 'Help Center', titleColor: AppColor.green),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'Frequently Asked Questions',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 16.h),

              // FAQ List using ExpansionTile
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.helpCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.green.withOpacity(0.2)),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        leading: Icon(
                          controller.helpCategories[index]['icon'] as IconData,
                          color: AppColor.green,
                        ),
                        title: Text(
                          controller.helpCategories[index]['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                        iconColor: AppColor.green,
                        collapsedIconColor: Colors.grey,
                        childrenPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                        children: [
                          Text(
                            controller.helpCategories[index]['ans'],
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: textColor.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
              SizedBox(height: 16.h),

              // Contact Section
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColor.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.headset_mic, color: AppColor.green, size: 30.sp),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Couldn\'t find your answer? Contact us!',
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColor.green, size: 18),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      );
    });
  }
}