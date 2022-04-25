import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mdmrest/controllers/authContoller.dart';

import '../../../widgets/rounded_elevated_button.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    @required this.formKey,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);
  final GlobalKey<FormState>? formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController()  );
    return Expanded(flex: 1,child: SingleChildScrollView(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          RoundedElevatedButton(title: '${Text('Sign in' , maxLines: 1)}',
            onPressed: (){
            if (formKey!.currentState!.validate()){
              String email = emailController!.text.trim();
              String password = passwordController!.text;

              controller.singIn(email, password);
            }
            },
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.4,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
          )
        ],
      ),

    ));
  }
}
