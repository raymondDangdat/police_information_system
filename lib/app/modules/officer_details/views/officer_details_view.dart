import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/data/officers_model.dart';

import '../controllers/officer_details_controller.dart';
import 'package:get/get.dart';

class OfficerDetailsView extends GetView<OfficerDetailsController> {

  final officer = Get.arguments as OfficerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Officer's Details"),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            
            Container(height: 200, width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(officer.profile!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(100)
            ),),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Name:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Phone:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.phone}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Email:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.email}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Gender:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.gender}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Height:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.height}cm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Marital Status:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.maritalStatus}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Age:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.age}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),


            SizedBox(height: 10,),
            Row(
              children: [
                Text('Rank:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.rank}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Station:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.station}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text('Address:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(width: 20,),

                Expanded(child: Text('${officer.address}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue))),


              ],
            ),
          ],
        ),
      )),
    );
  }
}
