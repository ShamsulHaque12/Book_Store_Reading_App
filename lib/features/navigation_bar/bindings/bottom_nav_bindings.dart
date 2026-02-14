import 'package:book_store/features/navigation_bar/controller/bottom_nav_controller.dart';
import 'package:get/instance_manager.dart';

class BottomNavBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
