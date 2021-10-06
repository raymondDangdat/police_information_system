
import 'package:get/get.dart';
import 'package:police_info_system/app/modules/login/controllers/login_controller.dart';

class MainAppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => Get.put(LoginController));
    Get.put<LoginController>(LoginController());
  }
}