import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInputs extends StatelessWidget {
  const EmailInputs(
      {Key? key, this.emailFieldController})
      : super(key: key);
  final emailFieldController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            key: Key('email'),
            keyboardType: TextInputType.emailAddress,
            controller: emailFieldController,
            decoration: InputDecoration(
              hintText: 'smart@gmail.com',
              labelStyle: TextStyle(color: Color.fromRGBO(155, 169, 201, 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(155, 169, 201, 1),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(47, 77, 145, 1)),
                  borderRadius: BorderRadius.circular(10)
              ),
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

            validator: (val){
              if(GetUtils.isEmail(val!)){
                return null;
              }else{
                return "Enter a valid email";
              }
            }),

        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
