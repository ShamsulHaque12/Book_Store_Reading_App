import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/core/custom_app_bar.dart';
import 'package:book_store/features/book_details/controller/free_book_details_conreoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';

class FreeBookDetailsView extends StatelessWidget {
  FreeBookDetailsView({super.key});
  final FreeBookDetailsConreoller controller = Get.put(
    FreeBookDetailsConreoller(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    final item = Get.arguments; // নিশ্চিত হোন আপনার আইটেমে প্রয়োজনীয় ডাটা আছে

    return Obx(() {
      final isDark = theme.isDark.value;
      final textColor = isDark ? Colors.white : Colors.black;
      final subTextColor = isDark ? Colors.white70 : Colors.black54;

      return Scaffold(
        backgroundColor: isDark
            ? AppDarkColor.background
            : AppLightColor.background,
        appBar: CustomAppBar(
          title: 'Free Book Details',
          titleColor: AppColor.green,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: AppColor.green),
            ),
            IconButton(
              onPressed: () => Share.share(item.title),
              icon: const Icon(Icons.share, color: AppColor.green),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section (Image & Basic Info) ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      item.image ?? 'https://via.placeholder.com/150',
                      width: 120.w,
                      height: 170.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "Book Title",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Author Name",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.green,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Publisher Name",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.green,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Released on Dec, 2015",
                          style: TextStyle(
                            color: subTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Wrap(
                          spacing: 6.w,
                          runSpacing: 4.h,
                          children: [
                            "Fantasy",
                            "Fiction",
                            "Magic",
                          ].map((tag) => _buildChip(tag, isDark)).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // --- Stats Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatColumn(
                    "4.9 ★",
                    "6.8K reviews",
                    textColor,
                    subTextColor,
                  ),
                  _buildStatColumn("5.6 MB", "size", textColor, subTextColor),
                  _buildStatColumn("784", "pages", textColor, subTextColor),
                  _buildStatColumn(
                    "50M+",
                    "purchases",
                    textColor,
                    subTextColor,
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // --- Buy Button ---
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    item.price ?? "Free",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // --- About Section ---
              _buildSectionTitle("About this Ebook", textColor),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ...",
                style: TextStyle(
                  color: subTextColor,
                  fontSize: 14.sp,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 24.h),

              // --- Ratings Section ---
              _buildSectionTitle("Ratings & Reviews", textColor),
              _buildRatingSummary(textColor, subTextColor),

              SizedBox(height: 30.h),

              // --- Rate this Book & Review Button ---
              Center(
                child: Text(
                  "Rate this Ebook",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_border,
                    color: AppColor.green,
                    size: 32.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Write a Review",
                    style: TextStyle(color: AppColor.green),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
  }

  // --- Helper Widgets ---

  Widget _buildChip(String label, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    String value,
    String label,
    Color txtColor,
    Color subTxtColor,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: txtColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 11.sp, color: subTxtColor),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Icon(Icons.arrow_forward, color: AppColor.green, size: 20),
        ],
      ),
    );
  }

  Widget _buildRatingSummary(Color textColor, Color subTextColor) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "4.9",
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Row(
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: AppColor.green, size: 14.sp),
              ),
            ),
            Text(
              "(6.8k reviews)",
              style: TextStyle(fontSize: 12.sp, color: subTextColor),
            ),
          ],
        ),
        SizedBox(width: 30.w),
        Expanded(
          child: Column(
            children: [5, 4, 3, 2, 1].map((i) => _buildRatingBar(i)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(int starNum) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text("$starNum", style: TextStyle(fontSize: 12.sp)),
          SizedBox(width: 8.w),
          Expanded(
            child: LinearProgressIndicator(
              value: starNum / 5,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.green),
              minHeight: 6.h,
            ),
          ),
        ],
      ),
    );
  }
}
