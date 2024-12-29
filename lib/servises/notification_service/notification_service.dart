/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_authenticity_fss/models/notification_model.dart';

class NotificationService{
  final  _notificationReference = FirebaseFirestore.instance.collection("notification").snapshots();
  Stream<List<NotificationModel>> getNotifications (){
    return _notificationReference.map((QuerySnapshot querySnapshot) {
      List<NotificationModel> notifications =[];
      for (var doc in querySnapshot.docs){
        var data = NotificationModel.fromDocumentSnapShot(doc);
        notifications.add(data);

      }
      return notifications;
    });
  }

}*/
