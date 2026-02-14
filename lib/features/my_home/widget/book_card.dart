import 'package:book_store/app_themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String rate;
  final double? width;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap; // ✅ new
  final Color titleColor;
  final Color infoColor;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rate,
    this.width,
    this.onTap,
    this.onMoreTap,
    required this.titleColor,
    required this.infoColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: width ?? 160.w,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image + More Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12.r)),
                  child: Image.network(
                    imageUrl,
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return SizedBox(
                        height: 150.h,
                        child: Center(
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColor.green,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) => SizedBox(
                      height: 150.h,
                      child: const Center(
                        child: Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                ),

                /// More Icon
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: onMoreTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.more_vert,
                        size: 18.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Title
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: titleColor,
                ),
              ),
            ),

            /// Rate + Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '⭐ $rate  •  $price',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: infoColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
