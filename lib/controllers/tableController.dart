import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmrest/model/table.dart';
import 'package:mdmrest/widgets/customDialog.dart';
import 'package:mdmrest/widgets/customSnackBar.dart';


class TableController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameTController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReferenceT;

  RxList<TableModel> tables = RxList<TableModel>([]);

  @override
  void onInit() {
    nameTController = TextEditingController();
    collectionReferenceT = firebaseFirestore.collection('tables');
    tables.bindStream(getAllTables());
    super.onInit();
  }

  String? validateNameT(String value){
    if(value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }


  void saveUpdateTable(
      String nameT, String docId, int addEditFlag
      ){
    final isValid = formKey.currentState!.validate();
    if (!isValid){
      return;
    }
    formKey.currentState!.save();
    if(addEditFlag == 1){
      CustomDialog.showDialog();
      collectionReferenceT
          .add({'name': nameT}).whenComplete(() {
        CustomDialog.cancelDialog();
        clearEditingController();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Table Added",
            message: "Table Added succesfully",
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
      collectionReferenceT
          .doc(docId)
          .update({'name': nameT,}).whenComplete(() {
        CustomDialog.cancelDialog();
        clearEditingController();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Table Updated",
            message: "Table updated succesfully",
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
    nameTController.dispose();
  }

  void clearEditingController() {
    nameTController.clear();
  }



  Stream<List<TableModel>> getAllTables() =>
      collectionReferenceT.snapshots().map((query) =>
          query.docs.map((item) => TableModel.fromMap(item)).toList());


  void deleteDataT(String docId){
    CustomDialog.showDialog();
    collectionReferenceT.doc(docId).delete().whenComplete(() {
      CustomDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Table Deleted",
          message: "Table deleted succesfully",
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