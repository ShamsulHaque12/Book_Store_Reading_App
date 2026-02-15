import 'package:book_store/app_themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountMenuTile extends StatelessWidget {
  final String title;
  final String iconAsset;
  final String? subtitle;

  /// for normal navigation tile
  final VoidCallback? onTap;

  /// for theme switch tile
  final bool showSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  final bool isDark;

  const AccountMenuTile({
    super.key,
    required this.title,
    required this.iconAsset,
    required this.isDark,
    this.subtitle,
    this.onTap,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        isDark ? AppLightColor.primary : AppDarkColor.primary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: showSwitch ? null : onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            /// Icon
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.1),
              ),
              child: SvgPicture.asset(
                iconAsset,
                fit: BoxFit.contain,
                color: primaryColor,
              ),
            ),

            SizedBox(width: 14.w),

            /// Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),

                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: primaryColor.withOpacity(0.65),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            /// Trailing Widget
            showSwitch
                ? Switch(
                    value: switchValue,
                    onChanged: onSwitchChanged,
                    activeThumbColor: primaryColor,
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: primaryColor.withOpacity(0.6),
                  ),
          ],
        ),
      ),
    );
  }
}
