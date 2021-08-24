import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/widgets/main_drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Information System'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.changeTheme(ThemeData.dark());
          }, icon: Icon(Icons.light_mode))
        ],
      ),
      drawer: MainDrawer(),
      body: Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Home Men")
            ],
          ),
        )),
      )
    );
  }
}
