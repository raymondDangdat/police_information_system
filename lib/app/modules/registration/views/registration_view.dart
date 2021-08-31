import 'dart:io';

import 'package:age/age.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:police_info_system/app/modules/login/views/login_view.dart';
import 'package:police_info_system/app/modules/registration/controllers/registration_controller.dart';
import 'package:police_info_system/app/widgets/custom_widgets.dart';
import 'package:police_info_system/app/widgets/input_fields.dart';

class RegistrationView extends StatefulWidget {
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  RegistrationController controller = Get.put(RegistrationController());

  String? birthDateInString;
  String? dateRecruitedInString;
  File? imageFile;

  DateTime today = DateTime.now(); //2020/1/24

  AgeDuration? age;


  String rank = "Constable";
  String gender = "Male";
  String maritalStatus = "Single";
  String initValue = "Select your Birth Date";
  DateTime? birthDate;
  DateTime? dateRecruited;
  bool isDateRecruitedSelected = false;
  String initialDateRecruited = "Select date recruited";
  bool isDateSelected = false;

  final ImagePicker _picker = ImagePicker();

  XFile? xFile;

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Upload Food from"),
            children: [
              SimpleDialogOption(
                  child: Text("Camera"),
                  onPressed:(){
                    handleTakePhoto(context);
                  }
              ),
              SimpleDialogOption(
                  child: Text("Gallery"),
                  onPressed: (){
                    handleChooseFromGallery(context);
                  }
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  handleTakePhoto(BuildContext context) async {
    Navigator.pop(context);
    final XFile? file = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 675, maxWidth: 960);
    setState(() {
      xFile = file;
      imageFile = File(file!.path);
    });
  }

  handleChooseFromGallery(BuildContext context) async {
    Navigator.pop(context);
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      xFile = file;
      imageFile = File(file!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register '),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: (){
                      selectImage(context);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                      ),
                      //
                      child: xFile != null ? Image.file(
                          File(xFile!.path), fit: BoxFit.cover
                      ) : Image.asset('assets/images/upload.png', fit: BoxFit.cover,),
                    ),
                  ),
                ),

                Form(
                  key: formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20,),
                      EmailInputs(
                        emailFieldController: controller.emailController,
                      ),

                      TextFormField(
                          key: Key('full-name'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.fullNameController,
                          decoration: InputDecoration(
                            hintText: 'Enter full name, last name first',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(155, 169, 201, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 10) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          key: Key('address'),
                          controller: controller.addressController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Enter Address',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(155, 169, 201, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 10) {
                              return 'Please enter a valid address';
                            }
                            return null;
                          }),
                      SizedBox(height: 10,),
                      TextFormField(
                          key: Key('phoneNumber'),
                          maxLength: 11,
                          controller: controller.phoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'Phone number e.g 09092355158',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(155, 169, 201, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 11) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          }),
                      SizedBox(height: 10,),
                      TextFormField(
                          key: Key('height'),
                          controller: controller.heightController,
                        maxLength: 3,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'Valid height in CM. e.g 150cm',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(155, 169, 201, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 2) {
                              return 'Please enter a valid height';
                            }
                            return null;
                          }),
                      SizedBox(height: 10,),
                    DropdownButton<String>(
                      value: rank,
                      hint: Text('Rank'),
                      onChanged: (String? newValue) {
                        setState(() {
                          rank = newValue!;
                          controller.rank.value = newValue;
                          print("Rank: $rank");

                        });
                      },
                      items: <String>['Constable', 'CORPORAL', 'SERGEANT', 'SERGEANT MAJOR', 'INSPECTOR OF POLICE', 'ASSISTANT SUPERINTENDENT OF POLICE', 'DEPUTY SUPERINTENDENT OF POLICE',
                      'SUPERINTENDENT OF POLICE', 'CHIEF SUPERINTENDENT OF POLICE', 'ASSISTANT COMMISSIONER OF POLICE',
                      'DEPUTY COMMISSIONER OF POLICE', 'COMMISSIONER OF POLICE',
                      'ASSISTANT INSPECTOR GENERAL OF POLICE', ' DEPUTY INSPECTOR GENERAL OF POLICE', 'INSPECTOR GENERAL OF POLICE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                      SizedBox(height: 10,),
                      DropdownButton<String>(
                        hint: Text('Select Gender'),
                        isExpanded: true,
                        value: gender,
                        onChanged: (String? newValue) {
                          setState(() {
                            gender = newValue!;
                            controller.gender.value = newValue;
                          });
                        },
                        items: <String>['Female', 'Male', ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10,),
                      DropdownButton<String>(
                        hint: Text('Marital Status'),
                        isExpanded: true,
                        value: maritalStatus,
                        onChanged: (String? newValue) {
                          setState(() {
                            maritalStatus = newValue!;
                            controller.maritalStatus.value = newValue;
                            print("Marital status: ${controller.maritalStatus.value}");
                          });
                        },
                        items: <String>['Single', 'Married', 'Divorced', 'Other' ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Date Recruited', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isDateRecruitedSelected ? "$dateRecruitedInString":initialDateRecruited),
                          GestureDetector(
                              child: new Icon(Icons.calendar_today_outlined, color: Colors.blueAccent,),
                              onTap: ()async{
                                final datePick= await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime.now()
                                );
                                if(datePick!=null && datePick!=dateRecruited){
                                  setState(() {
                                    dateRecruited = datePick;
                                    isDateRecruitedSelected = true;

                                    // put it here
                                    dateRecruitedInString = "${dateRecruited!.month}/${dateRecruited!.day}/${dateRecruited!.year}"; // 08/14/2019
                                    controller.dateRecruited.value = dateRecruitedInString!;

                                  });
                                }
                              }
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isDateSelected ? "$birthDateInString":initValue),
                          GestureDetector(
                              child: new Icon(Icons.calendar_today, color: Colors.blueAccent,),
                              onTap: ()async{
                                final datePick= await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime.now()
                                );
                                if(datePick!=null && datePick!=birthDate){
                                  setState(() {
                                    birthDate = datePick;
                                    isDateSelected = true;

                                    // put it here
                                    birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019


                                    age = Age.dateDifference(
                                        fromDate: birthDate, toDate: today, includeToDate: false);
                                    print("Age======${age!.years}");
                                    controller.age.value = age!.years;

                                  });
                                }
                              }
                          ),
                        ],
                      ),

                      if(isDateSelected)
                      Row(
                        children: [
                          Text('Age: ${age!.years}'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 20,),
                      Obx(() =>TextFormField(
                          key: Key('password'),
                          controller: controller.passwordController,
                          obscureText: controller.passwordInvisible.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                                icon: Icon(controller.passwordInvisible.value? Icons.visibility_off_outlined : Icons.visibility),
                                onPressed: () {
                                  controller.passwordInvisible.value = !controller.passwordInvisible.value;
                                }),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(155, 169, 201, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(155, 169, 201, 1),
                                )),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 6) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          })),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: controller.authenticating.value ? Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),) : customButton(context, 'Register', () {
                          final form = formState.currentState;
                          if (form!.validate() ) {
                            if(isDateSelected){
                              if(isDateRecruitedSelected){
                                if(imageFile != null){
                                  controller.register(imageFile!);
                                }else{
                                  Get.snackbar("Passport", "Upload Profile Image", backgroundColor: Colors.white);
                                }
                              }else{
                                Get.snackbar("Date Recruited", 'Select Date Recruited' , backgroundColor: Colors.white);
                              }
                            }else{
                              Get.snackbar("DoB", 'Choose Date of Birth' , backgroundColor: Colors.white);
                            }
                          }
                        }),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){
                            Get.off(() => LoginView());
                          }, child: Text("Have an account?")),
                          TextButton(onPressed: (){
                          }, child: Text("Forgot Password?"))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
    );
  }
}
