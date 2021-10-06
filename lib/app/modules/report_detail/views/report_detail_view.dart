import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_detail_controller.dart';

class ReportDetailView extends GetView<ReportDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReportDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
