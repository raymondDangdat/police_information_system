import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:police_info_system/app/widgets/custom_widgets.dart';
import 'package:police_info_system/app/widgets/input_fields.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
              EmailInputs(
                emailFieldController: _emailFieldController,
              ),

              TextFormField(
                  key: Key('email'),
                  obscureText: controller.passwordInvisible.value,
                  controller: _passwordFieldController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.visibility_off_outlined),
                        onPressed: () {
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
                    if (value == null || value.isEmpty) {
                      print("Something");
                      return 'Please enter a valid password';
                    }
                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: authenticating ? Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),) : customButton(context, 'Login', () {
                  _searchEmailExist(context, _emailFieldController.text);

                  // Navigator.pushNamed(context, PasswordScreen.routeName);
                }),
              )
            ],
          ),
        ),
      ))
    );
  }

  void _searchEmailExist(BuildContext context, String text) {}
}
