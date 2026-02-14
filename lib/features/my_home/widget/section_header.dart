import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onTap;
  final Color titleColor;
  final Color actionColor;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = 'See all',
    this.onTap,
    required this.titleColor,
    required this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            color: titleColor,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: actionColor,
            ),
          ),
        ),
      ],
    );
  }
}
