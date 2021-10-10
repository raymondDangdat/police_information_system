import 'package:get/get.dart';

import '../controllers/stations_controller.dart';

class StationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StationsController>(
      () => StationsController(),
    );
  }
}
