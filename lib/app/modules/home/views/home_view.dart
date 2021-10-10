import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/modules/login/controllers/login_controller.dart';
import 'package:police_info_system/app/widgets/main_drawer.dart';


class HomeView extends StatelessWidget {
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Information System'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.changeTheme(ThemeData.dark());
          }, icon: Icon(Icons.light_mode))
        ],
      ),
      drawer: MainDrawer(),
      body: Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              loginController.userInfo.value.email == "policeadmin@gmail.com"?
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Text("Pending Officers", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                SizedBox(height: 20,),
                                Text("100", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                              ],
                            ),
                          )),

                          SizedBox(width: 10,),

                          Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text("Approved Officers", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 20,),
                                    Text("500", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              )),
                        ],
                      ),

                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text("Reports", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 20,),
                                    Text("700", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              )),

                          SizedBox(width: 10,),

                          Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text("Signals", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 20,),
                                    Text("10", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              )),
                        ],
                      ),


                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text("Queries", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 20,),
                                    Text("50", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              )),

                          SizedBox(width: 10,),

                          Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Text("Stations", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 20,),
                                    Text("100", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              )),
                        ],
                      ),

                    ],
                  ):
                  Column(
                    children: [

                    ],
                  )
            ],
          ),
        )),
      )
    );
  }
}
