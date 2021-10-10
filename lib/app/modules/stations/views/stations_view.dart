import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/routes/app_pages.dart';

import '../controllers/stations_controller.dart';

class StationsView extends GetView<StationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stations'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.REGISTER_STATION);
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
