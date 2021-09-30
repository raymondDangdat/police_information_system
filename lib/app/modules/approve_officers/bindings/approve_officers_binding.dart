import 'package:get/get.dart';

import '../controllers/approve_officers_controller.dart';

class ApproveOfficersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApproveOfficersController>(
      () => ApproveOfficersController(),
    );
  }
}
