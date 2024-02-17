import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreInstance {
  static CollectionReference<Map<String, dynamic>> favorites =
      FirebaseFirestore.instance.collection('favorites');
  static CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');
}
