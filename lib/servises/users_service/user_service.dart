import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_authenticity_fss/models/users_model.dart';

class UsersService {
  final CollectionReference _usersReference = FirebaseFirestore.instance.collection("users");
  final CollectionReference _notificationReference = FirebaseFirestore.instance.collection("notification");
  Future<List<QueryDocumentSnapshot>> getUsers () async{
    var userData = await _usersReference.get();
    return userData.docs;
  }
  Future<List<QueryDocumentSnapshot>> getUserNotification (String userId) async{
    var userData = await _notificationReference.where('userID' ,isEqualTo:userId ).get();
    return userData.docs;
  }
}