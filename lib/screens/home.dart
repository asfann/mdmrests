import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmrest/controllers/authContoller.dart';
import 'package:mdmrest/widgets/hero_title.dart';
import 'package:mdmrest/widgets/rounded_elevated_button.dart';

import '../config.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Center(
      child: Column(
        children: [
          HeroTitle(
              title: 'Hello ${_authController.displayName.toString()}',
              subtitle: 'Let\'s Begin'),
          Expanded(flex: 8,child: Container()),
          RoundedElevatedButton(title: 'Sign out!', onPressed: ()=>_authController.signOut(),
          padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! *0.2),)
        ],
      ),
    );
  }
}
