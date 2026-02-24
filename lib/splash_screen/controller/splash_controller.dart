import 'package:book_store/route/app_routes.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.loginInScreen);
    });
  }
}
