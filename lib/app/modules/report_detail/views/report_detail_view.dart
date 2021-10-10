import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:police_info_system/app/data/report_model.dart';

import '../controllers/report_detail_controller.dart';

class ReportDetailView extends GetView<ReportDetailController> {
  final report = Get.arguments as ReportModel;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Detail'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [

            Row(
              children: [
                Text("Station:", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                SizedBox(width: 10,),
                Expanded(child: Text("${report.station!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Text("Officer:", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                SizedBox(width: 10,),
                Expanded(child: Text("${report.reporterName!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Text("Date Reported:", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                SizedBox(width: 10,),

                Expanded(child: Text("${DateFormat.yMMMEd().format(DateTime.parse(report.date!))}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Expanded(child: Text("${report.reportSubject!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Expanded(child: Text("${report.description!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
              ],
            ),
          ],
        ),
      ))
    );
  }
}
