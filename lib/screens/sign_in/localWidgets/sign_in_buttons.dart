
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mdmrest/controllers/authContoller.dart';

import '../../../config.dart';
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
    final _authController = Get.find<AuthController>();
    return Expanded(flex: 1,child: SingleChildScrollView(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          RoundedElevatedButton(title: 'Sign in',
            onPressed: (){
            if (formKey!.currentState!.validate()){
              String email = emailController!.text.trim();
              String password = passwordController!.text;

              _authController.singIn(email, password);
            }
            },
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.4,
              vertical: Config.screenHeight! * 0.02,
            ),
          )
        ],
      ),

    ));
  }
}
