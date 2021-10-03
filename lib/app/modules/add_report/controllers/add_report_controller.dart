import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReportController extends GetxController {
  late TextEditingController subject;
  late TextEditingController description;
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

}
