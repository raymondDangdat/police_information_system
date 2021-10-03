import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/widgets/custom_widgets.dart';

import '../controllers/add_report_controller.dart';

class AddReportView extends GetView<AddReportController> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Report'),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover,),
              ),
            ),
            Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20,),

                  TextFormField(
                    maxLines: 3,
                      key: Key('subject'),
                      controller: controller.subject,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Enter Report Subject',
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
                          return 'Please enter a valid subject';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 15,
                      key: Key('description'),
                      controller: controller.description,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Detail Description of the report',
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
                          return 'Please enter a valid subject';
                        }
                        return null;
                      }),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: customButton(context, 'Submit', () {
                      final form = formState.currentState;
                      if (form!.validate() ) {
                        // controller.signIn();
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      )
    );
  }
}
