import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/controllers/user_detail_controler.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final UserDetailController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: NetworkImage(userController.userDetail.profile!), fit: BoxFit.cover)
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                        right: 20,
                        child:
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: IconButton(
                          onPressed: (){

                          }, icon: Icon(Icons.edit, color: Colors.white,), iconSize: 25,),
                      alignment: Alignment.center,
                    )
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${userController.userDetail.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${userController.userDetail.rank}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 10,),

            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,

                ),
                child: QrImage(data: jsonEncode({
                  "name": "${userController.userDetail.name}",
                  "age": "${userController.userDetail.age}",
                  "rank": "${userController.userDetail.rank}",
                  "station": "${userController.userDetail.station}",
                "phone": "${userController.userDetail.phone}",
                "address": "${userController.userDetail.address}"
                }),
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                  // padding: EdgeInsets.all(5),
                  size: 200.0,
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.email_outlined, color: Colors.white,),
                              Text("${userController.userDetail.email}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )),

                      Column(
                        children: [
                          Icon(Icons.male, color: Colors.white,),
                          Text("${userController.userDetail.gender}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),


                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, color: Colors.white,),
                              Text("${userController.userDetail.phone}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )),

                      Column(
                        children: [
                          Icon(Icons.supervised_user_circle, color: Colors.white,),
                          Text("${userController.userDetail.maritalStatus}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_city, color: Colors.white,),
                              Text("${userController.userDetail.address}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                            ],
                          )),

                      Column(
                        children: [
                          Icon(Icons.date_range, color: Colors.white54,),
                          Text("${userController.userDetail.age}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),


                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.add_location, color: Colors.white,),
                          Text("${userController.userDetail.station}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ],
                  ),

                ],
              ),

              ),

          ],
        ),
      ))
    );
  }
}
