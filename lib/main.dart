
import 'package:book_store/app_theme_mode/app_theme.dart';
import 'package:book_store/app_theme_mode/theme_controller.dart';
import 'package:book_store/route/app_pages.dart';
import 'package:book_store/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return GetMaterialApp(
          title: 'Book Store',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
