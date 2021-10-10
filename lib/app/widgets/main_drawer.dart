import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/constants/shared_preferences.dart';
import 'package:police_info_system/app/controllers/user_detail_controler.dart';
import 'package:police_info_system/app/routes/app_pages.dart';

class MainDrawer extends StatelessWidget {
  final UserDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 0),
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
                left: 20, bottom: 20.0, top: 70, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        width: 126,
                        height: 126,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 245, 243, 1),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(image:  NetworkImage(
                            controller.userDetail.profile!), fit: BoxFit.cover)
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${controller.userDetail.name}'
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text('view Profile',
                    //     style:
                    //     customTextStyle(primaryColor, 9, 'Sofialight'))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

          if(SharedPrefs.sharedPreferences!.getString(SharedPrefs.userEmail) == "policeadmin@gmail.com")
                menuItems(menu: 'Approve Officers', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.APPROVE_OFFICERS);
                }),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20,),
                if(SharedPrefs.sharedPreferences!.getString(SharedPrefs.userEmail) == "policeadmin@gmail.com")
                  menuItems(menu: 'Register Station', onTapped: () {
                    Navigator.pop(context);
                    Get.toNamed(Routes.REGISTER_STATION);
                  }),
                SizedBox(
                  height: 20,
                ),

                menuItems(menu: 'Stations', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.STATIONS);
                }),
                SizedBox(
                  height: 20,
                ),

                menuItems(menu: 'Information', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.POLICE_INFO);
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),

                menuItems(menu: 'Query', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.QUERY);
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                menuItems(menu: 'Reports', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.REPORTS);
                }),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                menuItems(menu: 'Settings', onTapped: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.SETTINGS);
                }),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                menuItems(
                    menu: 'Help',
                    onTapped: () {
                      Navigator.pop(context);
                      Get.toNamed(Routes.HELP);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),

                menuItems(
                    menu: 'Logout',
                    onTapped: () async{
                      Navigator.pop(context);
                      controller.signOut();
                    }),
              ],
            ),
          ),
        ));
  }

  Widget menuItems({String? menu, required VoidCallback onTapped}) {
    return InkWell(
      onTap: onTapped,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              menu!,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
