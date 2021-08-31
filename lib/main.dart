import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/modules/login/controllers/login_controller.dart';
import 'package:police_info_system/app/modules/registration/controllers/registration_controller.dart';


import 'app/routes/app_pages.dart';
import 'app/utils/firebase.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => LoginController());
  });
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Police Info System",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
