import 'package:get/get.dart';

import '../controllers/register_station_controller.dart';

class RegisterStationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStationController>(
      () => RegisterStationController(),
    );
  }
}
