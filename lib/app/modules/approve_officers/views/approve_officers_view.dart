import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/approve_officers_controller.dart';

class ApproveOfficersView extends GetView<ApproveOfficersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approve Officers'),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ))
    );
  }
}
