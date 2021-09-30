import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/officer_details_controller.dart';

class OfficerDetailsView extends GetView<OfficerDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OfficerDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OfficerDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
