import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmrest/widgets/icon_buttons.dart';
import 'package:mdmrest/controllers/waiterController.dart';

class Waiters extends GetView<WaiterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
         actions: [
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Center(
                 child: IconBorder(
                   icon: CupertinoIcons.add,
                   onTap: () {
                     _buildAddEditWaiterView(text: 'add', addEditFlag: 1,docId: '');
                   },
                 ),
               )

           ),
       ],
      ),
      body: Obx(
          () => ListView.builder(
            itemCount: controller.waiters.length,
            itemBuilder: (context, index) => Card(
              color: Colors.grey,
              child: ListTile(
                title: Text(controller.waiters[index].name!),
                subtitle: Text(controller.waiters[index].surname!),
                leading: CircleAvatar(
                  child: Text(
                    controller.waiters[index].name!.substring(0,1).capitalize!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.yellow,
              ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    displayDeleteDialog(controller.waiters[index].docId!);
                  },
                ),
                onTap: () {
                  controller.nameController.text =
                      controller.waiters[index].name!;
                  controller.surnameController.text =
                      controller.waiters[index].surname!;
                  _buildAddEditWaiterView(
                    text: 'UPDATE',
                    addEditFlag: 2,
                    docId: controller.waiters[index].docId!
                  );
                },
              ),
            ),
          )
      )
    );
  }

  _buildAddEditWaiterView({String? text, int? addEditFlag, String? docId}){

    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
            child: Form(
              key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${text} Waiter',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      controller: controller.nameController,
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Surname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.surnameController,
                      validator: (value) {
                        return controller.validateSurname(value!);
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: Get.context!.width, height: 45
                        ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveUpdateWaiter(
                            controller.nameController.text,
                            controller.surnameController.text,
                            docId!,
                            addEditFlag!);
                      },
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    )
                  ],
                ),
            ),
          ),
        ),
      )
    );
  }


  displayDeleteDialog(String docId){
    Get.defaultDialog(
      title: 'Delete Waiter',
      titleStyle: TextStyle(fontSize: 20),
      middleText: "Are you sure to delete Waiter !",
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {

      },
      onConfirm: () {
        controller.deleteDataW(docId);
      }
    );
  }

}
