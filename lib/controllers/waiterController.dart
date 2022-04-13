import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmrest/widgets/customDialog.dart';
import 'package:mdmrest/widgets/customSnackBar.dart';

import '../model/waiter.dart';

class WaiterController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, surnameController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReferenceW;
  RxList<WaiterModel> waiters = RxList<WaiterModel>([]);

  @override
  void onInit() {
    nameController = TextEditingController();
    surnameController = TextEditingController();
    collectionReferenceW = firebaseFirestore.collection('waiters');
    waiters.bindStream(getAllWaiters());
    super.onInit();
  }

  String? validateName(String value){
    if(value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validateSurname(String value){
    if(value.isEmpty) {
      return "Surname can not be empty";
    }
    return null;
  }

  void saveUpdateWaiter(
      String name,String surname, String docId, int addEditFlag
      ){
    final isValid = formKey.currentState!.validate();
    if (!isValid){
      return;
    }
    formKey.currentState!.save();
    if(addEditFlag == 1){
      CustomDialog.showDialog();
      collectionReferenceW
      .add({'name': name,'surname':surname}).whenComplete(() {
        CustomDialog.cancelDialog();
        clearEditingController();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Waiter Added",
          message: "Waiter Added succesfully",
          backgroundColor: Colors.blue
        );
      }).catchError((error) {
        CustomDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.blue);
      });
    }
    else if (addEditFlag == 2) {
      //update
      CustomDialog.showDialog();
      collectionReferenceW
      .doc(docId)
      .update({'name': name, 'surname': surname,}).whenComplete(() {
        CustomDialog.cancelDialog();
        clearEditingController();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Waiter Updated",
            message: "Waiter updated succesfully",
            backgroundColor: Colors.blue);
      }).catchError((error) {
        CustomDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
    });
  }
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    surnameController.dispose();
  }

void clearEditingController() {
  nameController.clear();
  surnameController.clear();
}

Stream<List<WaiterModel>> getAllWaiters() =>
    collectionReferenceW.snapshots().map((query) =>
    query.docs.map((item) => WaiterModel.fromMap(item)).toList());









  void deleteDataW(String docId){
    CustomDialog.showDialog();
    collectionReferenceW.doc(docId).delete().whenComplete(() {
      CustomDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Waiter Deleted",
          message: "Waiter deleted succesfully",
          backgroundColor: Colors.blue);
    }).catchError((error){
      CustomDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }



}