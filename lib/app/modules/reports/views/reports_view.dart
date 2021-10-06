import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/routes/app_pages.dart';

import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Reports'),
        centerTitle: true,
      ),
      body: Obx(()=> ListView.builder(
    itemCount: controller.reports.length,
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index){
    final report = controller.reports[index];
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ListTile(
    onTap: (){
    Get.toNamed(Routes.REPORT_DETAIL, arguments: report);
    },
    title: Text(report.reportSubject!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue)),
    subtitle: Text(report.reporterName!),
    trailing: Text(report.station!),

    ),
    );
    })
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.ADD_REPORT);
      },
      child: Icon(Icons.add),),
    );
  }
}
