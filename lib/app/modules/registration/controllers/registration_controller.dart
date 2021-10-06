import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/utils/firebase.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

  FirebaseAuth auth = FirebaseAuth.instance;

  final count = 0.obs;
  RxBool authenticating = false.obs;
  RxBool passwordInvisible = true.obs;
  RxString rank = 'Constable'.obs;
  RxString gender = "Male".obs;
  RxString maritalStatus = "Single".obs;
  RxString dob = "".obs;
  RxString dateRecruited = "".obs;
  String usersCollection = "pisUsers";
  RxInt age = 0.obs;
  UploadTask? task;

  late TextEditingController fullNameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController heightController;
  late TextEditingController stationController;



  @override
  void onInit() {
    fullNameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    heightController = TextEditingController();
    stationController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    heightController.dispose();
    stationController.dispose();
  }

  void increment() => count.value++;
  void register(File profile) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      Get.dialog(
        LoadingCard(),
        barrierDismissible: false,
      );
      await auth
          .createUserWithEmailAndPassword(
          email: email, password: password)
          .then((result) async{
        String _userId = result.user!.uid;
        await uploadFile(profile, _userId);
        // await _addUserToFirestore(_userId, profile);
        _clearControllers();
      });
        Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e.toString());
      Get.back();
      Get.snackbar("Registration", e.toString(),
          backgroundColor: Colors.white);
    }
  }

  void _clearControllers() {
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    addressController.clear();
    heightController.clear();
    stationController.clear();
  }

  Future uploadFile(File file, String uId) async {

    final fileName = basename(file.path);
    final destination = 'profiles/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
      await _addUserToFirestore(uId, urlDownload);
  }

  Future?  _addUserToFirestore(String userId, String profileUrl) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": fullNameController.text,
      "id": userId,
      "email": emailController.text,
      "phone": phoneController.text,
      "address" : addressController.text,
      "age": age.value,
      "gender": gender.value,
      "maritalStatus": maritalStatus.value,
      "rank" : rank.value,
      'dateRecruited': dateRecruited.value,
      'height' : heightController.text,
      'profile': profileUrl,
      'approved': false,
      'station': stationController.text
    });
  }
}
