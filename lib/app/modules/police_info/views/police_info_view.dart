import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/routes/app_pages.dart';

import '../controllers/police_info_controller.dart';

class PoliceInfoView extends GetView<PoliceInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Information'),
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
                    Get.toNamed(Routes.OFFICER_DETAILS, arguments: officer);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(officer.profile!),
                    backgroundColor: Colors.blue,
                  ),
                  title: Text(officer.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue)),
                  subtitle: Text(officer.rank!.capitalize?? ''),
                  trailing: Text(officer.station!),

                ),
              );
            })
        )
    );
  }
}
