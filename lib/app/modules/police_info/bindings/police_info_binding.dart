import 'package:get/get.dart';

import '../controllers/police_info_controller.dart';

class PoliceInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliceInfoController>(
      () => PoliceInfoController(),
    );
  }
}
