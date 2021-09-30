import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/routes/app_pages.dart';

import '../controllers/approve_officers_controller.dart';

class ApproveOfficersView extends GetView<ApproveOfficersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approve Officers'),
        centerTitle: true,
      ),
      body: Obx(()=> ListView.builder(
    itemCount: controller.officers.length,
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index){
    final officer = controller.officers[index];
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ListTile(
      onTap: (){
        Get.toNamed(Routes.OFFICER_DETAILS);
      },
      leading: CircleAvatar(
      backgroundImage: NetworkImage(officer.profile!),
      backgroundColor: Colors.blue,
    ),
    title: Text(officer.name!),
    subtitle: Text(officer.rank!.capitalize?? ''),
    trailing: ElevatedButton(onPressed: (){
      officer.approved! ? null : approveOfficer(officer.id!);
    }, child: Text(officer.approved!?  'Approved' : 'Approve')),),
    );
    })
    ));
  }
  approveOfficer(String id) {
    controller.updateOfficer(id);
  }
}
