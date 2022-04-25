import 'package:flutter/material.dart';
import 'package:mdmrest/screens/sign_in/localWidgets/sign_in_buttons.dart';
import 'package:mdmrest/widgets/rounded_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Form(
        child: Form(
          key: _formKey,
          child: Column(
              children: [
                buildTextFormField(),
                SignInButtons(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                )
              ],
            ),

          ),
        ),
      );
  }


  Widget buildTextFormField() {
    return Column(
      children: [
        RoundedTextFormField
          (emailController: _emailController,
          hintText: 'Email', validator: (value) {
            bool _isEmailValid =
            RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!);
            if (!_isEmailValid) {
              return 'Invalid email';
            }
            return null;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        RoundedTextFormField(emailController: _passwordController,
          hintText: 'Password',
          obsecureText: true,
          validator: (value) {
            if (value
                .toString()
                .length < 6) {
              return 'Password should be longer or equal to 6 characters.';
            }
            return null;
          },
        ),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}