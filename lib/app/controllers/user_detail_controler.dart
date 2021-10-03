


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/constants/shared_preferences.dart';
import 'package:police_info_system/app/data/user_model.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/utils/firebase.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserDetailController extends GetxController {
  static UserDetailController instance = Get.find();
  Rx<User>? firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "pisUsers";
  UserModel userDetail = UserModel();
  RxBool showPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser!);
    // firebaseUser!.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }


  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }




  void signIn() async {
    try {
      Get.dialog(
        LoadingCard(),
        barrierDismissible: false,
      );
      await auth
          .signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) {
        SharedPrefs.sharedPreferences!.setString(SharedPrefs.userEmail, email.text.trim());
        _clearControllers();
      });

    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print("Saved email: ${prefs.getString('email')}");
    auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }


  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser!.value.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser!.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  void getUserDetails() async{
    DocumentSnapshot doc = await firebaseFirestore.collection(usersCollection).doc(FirebaseAuth.instance.currentUser!.uid).get();
    userDetail = UserModel.fromSnapshot(doc);

  }
}
