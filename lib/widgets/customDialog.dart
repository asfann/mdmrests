import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog{
  static void showDialog(){
    Get.dialog(
      WillPopScope(child: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
          onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(.3),
      useSafeArea: true
    );
}


static void cancelDialog() {
    Get.back();
}
}