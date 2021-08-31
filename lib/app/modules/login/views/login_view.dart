import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/modules/home/views/home_view.dart';
import 'package:police_info_system/app/modules/registration/views/registration_view.dart';
import 'package:police_info_system/app/widgets/custom_widgets.dart';
import 'package:police_info_system/app/widgets/input_fields.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {

  LoginController controller = Get.put(LoginController());

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool authenticating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                  EmailInputs(
                    emailFieldController: controller.emailController,
                  ),
                  Obx(() => TextFormField(
                      key: Key('password'),
                      obscureText: controller.passwordInvisible.value,
                      controller: controller.passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.lock_rounded),
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: customButton(context, 'Login', () {
                      final form = formState.currentState;
                      if (form!.validate() ) {
                        controller.signIn();
                      }
                    }),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        Get.off(() => RegistrationView());
                      }, child: Text("Don't have an account?")),
                      TextButton(onPressed: (){}, child: Text("Forgot Password?"))
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
