import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userName;
  final String? email;
  final String? uid;
  UserModel({required this.userName,required this.email,required this.uid});
  
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(userName: doc["fullName"], email: doc["email"],uid:doc.id);
  }
}