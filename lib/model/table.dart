import 'package:cloud_firestore/cloud_firestore.dart';

class TableModel{
  String? docId;
  String? name;


  TableModel({ this.name,  });

  TableModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data['name'];
  }
}