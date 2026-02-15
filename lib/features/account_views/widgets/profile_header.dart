import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/app_themes/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  final bool isDark;

  const ProfileHeader({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70.h,
          width: 70.h,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.withOpacity(0.1),
          ),
          child: ClipOval(
            child: Image.asset(
              AppImage.logo,
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Name',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppLightColor.primary
                      : AppDarkColor.primary,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                'user@email.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: (isDark
                          ? AppLightColor.primary
                          : AppDarkColor.primary)
                      .withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
