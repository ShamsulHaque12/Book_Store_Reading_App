import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_icon.dart';
import 'package:book_store/features/account_views/widgets/account_menu_tile.dart';
import 'package:book_store/features/account_views/widgets/profile_header.dart';
import 'package:book_store/features/edit_profile/views/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),

                /// 🔹 Profile Header
                ProfileHeader(isDark: isDark),

                SizedBox(height: 8.h),

                Divider(
                  thickness: 3.h,
                  color: isDark
                      ? AppLightColor.primary.withOpacity(0.2)
                      : AppDarkColor.primary.withOpacity(0.2),
                ),
                SizedBox(height: 12.h),

                /// 🔹 Account Menu
                AccountMenuTile(
                  title: 'Payment Methods',
                  iconAsset: AppIcon.purchased,
                  isDark: isDark,
                  onTap: () {
                    // navigate to purchased screen
                  },
                ),
                AccountMenuTile(
                  title: 'Personal Info',
                  iconAsset: AppIcon.account,
                  isDark: isDark,
                  onTap: () {
                    // Right-to-left slide transition with GetX
                    Get.to(
                      () => EditProfile(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                ),
                AccountMenuTile(
                  title: 'Notifications',
                  iconAsset: AppIcon.notification,
                  isDark: isDark,
                  onTap: () {
                    // navigate to purchased screen
                  },
                ),
                AccountMenuTile(
                  title: 'Language',
                  subtitle: 'English',
                  iconAsset: AppIcon.purchased,
                  isDark: isDark,
                  onTap: () {},
                ),
                AccountMenuTile(
                  title: 'Dark Mode',
                  subtitle: 'Change app appearance',
                  iconAsset: AppIcon.theme,
                  isDark: isDark,
                  showSwitch: true,
                  switchValue: isDark,
                  onSwitchChanged: (value) {
                    theme.toggleTheme();
                  },
                ),
                AccountMenuTile(
                  title: 'Change Password',
                  iconAsset: AppIcon.password,
                  isDark: isDark,
                  onTap: () {
                    // navigate to purchased screen
                  },
                ),
                AccountMenuTile(
                  title: 'Help Center',
                  iconAsset: AppIcon.help,
                  isDark: isDark,
                  onTap: () {
                    // navigate to purchased screen
                  },
                ),
                AccountMenuTile(
                  title: 'Logout',
                  iconAsset: AppIcon.logout,
                  isDark: isDark,
                  onTap: () {
                    showLogoutDialog(isDark);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void showLogoutDialog(bool isDark) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: isDark ? AppLightColor.primary : AppDarkColor.primary,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: (isDark ? AppLightColor.primary : AppDarkColor.primary)
                .withOpacity(0.7),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                color: isDark ? AppLightColor.primary : AppDarkColor.primary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
