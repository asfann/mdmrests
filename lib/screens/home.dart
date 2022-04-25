import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmrest/controllers/authContoller.dart';
import 'package:mdmrest/screens/tables/tables.dart';
import 'package:mdmrest/screens/waiters/waiters.dart';
import 'package:mdmrest/widgets/icon_buttons.dart';
import 'package:mdmrest/widgets/rounded_elevated_button.dart';





class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find();
    return Scaffold(
      appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(icon: CupertinoIcons.xmark,
              onTap: () {
              _authController.signOut();
              },),
          ),
      ),
      body: Container(
        child:  Column(
            children: [
              RoundedElevatedButton(title: 'Waiters', onPressed: () {
               Get.to(() => Waiters());
              },   padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.4,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedElevatedButton(title: 'Tables', onPressed: () {
                Get.to(() => Tables());
              },    padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.4,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),

              ),
              SizedBox(
                height: 10,
              ), RoundedElevatedButton(title: 'Dishes ', onPressed: () {

              },    padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.4,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              )
            ],
          ),
        ),

          );
  }
}
