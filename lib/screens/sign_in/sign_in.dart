import 'package:flutter/material.dart';
import 'package:mdmrest/config.dart';
import 'package:mdmrest/widgets/hero_img.dart';
import '../../widgets/hero_title.dart';
import 'localWidgets/sign_in_form.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         HeroTitle(title: 'Welcome!', subtitle: 'Enter email and password to login...',),
         HeroImg(path: 'assets/loginHero.svg', semanticsLabel: 'Login Hero',),
         SignInForm(),
      ],
    );
  }
}
