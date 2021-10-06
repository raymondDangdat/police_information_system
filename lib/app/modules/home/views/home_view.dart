import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/controllers/user_controller.dart';
import 'package:police_info_system/app/widgets/main_drawer.dart';


class HomeView extends StatelessWidget {
  UserController controller = Get.put(UserController());
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
              Text('${controller.phone}')
            ],
          ),
        )),
      )
    );
  }
}
