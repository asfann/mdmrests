import 'package:cloud_firestore/cloud_firestore.dart';

class WaiterModel{
   String? docId;
   String? name;
   String? surname;

  WaiterModel({ this.name,  this.surname, });


  WaiterModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data['name'];
    surname = data['surname'];
  }


}


