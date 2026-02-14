import 'package:get/state_manager.dart';

class BottomNavController extends GetxController{

  var currentIndex = 0.obs;
  
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}