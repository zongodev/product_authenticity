import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? title;
  final String? content;
  final String? qrData;
  final String? userEmail;

  NotificationModel(
      {required this.title,
      required this.content,
      required this.qrData,
      required this.userEmail});

  factory NotificationModel.fromDocumentSnapShot(DocumentSnapshot doc) {
    return NotificationModel(
      title: doc["Title"],
      content: doc["Content"],
      qrData: doc["qrData"],
      userEmail: doc["userEmail"],
    );
  }
}
