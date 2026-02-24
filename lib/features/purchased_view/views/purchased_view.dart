import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/app_themes/app_color.dart';
import 'package:book_store/features/purchased_view/controller/purchased_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PurchasedView extends StatelessWidget {
  PurchasedView({super.key});
  final PurchasedBookController controller = Get.put(PurchasedBookController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    
    return Obx(() {
      final isDark = theme.isDark.value;
      return Scaffold(
        backgroundColor: isDark ? AppDarkColor.background : AppLightColor.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Purchased Books",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.books.length,
                      itemBuilder: (context, index) {
                        final book = controller.books[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              book.imageUrl,
                              width: 50.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  width: 50.w,
                                  height: 80.h,
                                  color: Colors.grey[300],
                                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) => 
                                  Container(
                                    width: 50.w, height: 80.h, color: Colors.grey,
                                    child: Icon(Icons.broken_image, color: Colors.white),
                                  ),
                            ),
                          ),
                          title: Text(
                            book.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 15.sp,
                              color: isDark ? AppLightColor.primary : AppDarkColor.primary,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, size: 14.sp, color: Colors.orange),
                                  SizedBox(width: 4.w),
                                  Text("${book.rating}", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                              Text(book.status, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            icon: Icon(Icons.more_vert, color: isDark ? Colors.white70 : Colors.black54),
                            onSelected: (value) {
                              _handleMenuAction(value, book, index);
                            },
                            itemBuilder: (context) => [
                              _buildPopupItem('share', Icons.share, 'Share'),
                              _buildPopupItem('download', Icons.download, 'Download'),
                              _buildPopupItem('remove', Icons.delete, 'Remove', color: Colors.red),
                            ],
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  PopupMenuItem<String> _buildPopupItem(String value, IconData icon, String title, {Color? color}) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.sp),
          SizedBox(width: 10.w),
          Text(title, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  void _handleMenuAction(String value, var book, int index) {
    switch (value) {
      case 'share':
        Get.snackbar("Share", "Sharing ${book.title}");
        break;
      case 'download':
        Get.snackbar("Download", "Downloading ${book.title}");
        break;
      case 'remove':
        controller.books.removeAt(index);
        Get.snackbar("Removed", "Book removed from list", snackPosition: SnackPosition.BOTTOM);
        break;
    }
  }
}