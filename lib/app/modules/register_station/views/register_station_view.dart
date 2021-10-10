import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_station_controller.dart';

class RegisterStationView extends GetView<RegisterStationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Station'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegisterStationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
