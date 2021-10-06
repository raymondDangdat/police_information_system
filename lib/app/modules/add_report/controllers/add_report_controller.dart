import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/modules/login/controllers/login_controller.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/utils/firebase.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';

class AddReportController extends GetxController {
  late TextEditingController subject;
  late TextEditingController description;
  String reportsCollection = "pisReports";

  final LoginController loginController = Get.find();
  //TODO: Implement AddReportController

  final count = 0.obs;
  @override
  void onInit() {
    subject = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _clearControllers() {
    subject.clear();
    description.clear();
  }

  @override
  void onClose() {
    subject.dispose();
    description.dispose();
  }


  void sendReport() async{
    print("Station: ${loginController.userInfo.value.station}");
    try{
      Get.dialog(
        LoadingCard(),
        barrierDismissible: false,
      );
      firebaseFirestore.collection(reportsCollection).doc().set({
        "reporterName": loginController.userInfo.value.name,
        "id": loginController.userInfo.value.id,
        "reportSubject": subject.text,
        "description": description.text,
        "date": DateTime.now().toString(),
        "station": loginController.userInfo.value.station
      }).then((value) {
        _clearControllers();
        Get.back();
        Get.toNamed(Routes.REPORTS);
      });
    }catch (e) {
      Get.back();
      Get.snackbar("Error!", e.toString(),
          backgroundColor: Colors.white);
    }
  }


}
