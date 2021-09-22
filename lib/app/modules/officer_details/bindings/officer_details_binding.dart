import 'package:get/get.dart';

import '../controllers/officer_details_controller.dart';

class OfficerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficerDetailsController>(
      () => OfficerDetailsController(),
    );
  }
}
