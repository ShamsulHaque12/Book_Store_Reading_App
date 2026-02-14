import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTextCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Gradient? overlayGradient;

  const ImageTextCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.overlayGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 140.w,
      height: height ?? 180.h,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          /// ✅ Image clickable
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(14),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),

          /// Overlay gradient (no tap)
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(14),
                gradient: overlayGradient ??
                    const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ],
                    ),
              ),
            ),
          ),

          /// ❌ Text NOT clickable
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: IgnorePointer(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
