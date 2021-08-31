import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/utils/firebase.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  RxBool passwordInvisible = true.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Get.dialog(
        LoadingCard(),
        barrierDismissible: false,
      );
      await auth
          .signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim())
          .then((result) {
        prefs.setString('email', emailController.text.trim());
        _clearControllers();
        Get.offAllNamed(Routes.HOME);
      });

    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      Get.snackbar("Sign In Failed", "${e.toString()}");
    }
  }
}
