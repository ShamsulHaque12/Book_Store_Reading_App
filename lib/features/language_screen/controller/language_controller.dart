import 'package:get/get.dart';

class LanguageController extends GetxController {
  // 0 for English, 1 for Bangla
  RxInt languageIndex = 0.obs;

  final List<String> languages = [
    'English',
    'Bangla',
  ];

  void changeLanguage(int index) {
    languageIndex.value = index;
  }
}