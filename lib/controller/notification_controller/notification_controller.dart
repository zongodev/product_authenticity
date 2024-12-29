import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/models/notification_model.dart';
import 'package:product_authenticity_fss/models/reportmodel.dart';
import 'package:product_authenticity_fss/servises/notification_service/notification_service.dart';

class NotificationController extends GetxController {
  // final NotificationService notificationService = NotificationService();
  final Rx<List<NotificationModel>> _notificationList =
      Rx<List<NotificationModel>>([]);
  final Rx<List<ReportModel>> _reportList =
  Rx<List<ReportModel>>([]);
  RxInt notificationCount = 0.obs;
  RxInt reportCount = 0.obs;
  List<NotificationModel> get notificationList => _notificationList.value;
  List<ReportModel> get reportList => _reportList.value;
/*  final Stream<QuerySnapshot>notificationReference =
      FirebaseFirestore.instance.collection("notification").snapshots();*/
  final _notificationReference =
      FirebaseFirestore.instance.collection("notification").snapshots();
  final _reportReference =
  FirebaseFirestore.instance.collection("reports").snapshots();

  Stream<List<NotificationModel>> getNotifications() {

    return _notificationReference.map((QuerySnapshot querySnapshot) {
      _notificationList.value.clear();
      for (var doc in querySnapshot.docs) {
        var data = NotificationModel.fromDocumentSnapShot(doc);

        _notificationList.value.add(data);
        notificationCount.value=_notificationList.value.length;
        update();

      }
      return _notificationList.value;

    });
  }
  Stream<List<ReportModel>> getReport() {

    return _reportReference.map((QuerySnapshot querySnapshot) {
      _reportList.value.clear();
      for (var doc in querySnapshot.docs) {
        var data = ReportModel.fromDocumentSnapshot(doc);

        _reportList.value.add(data);
        reportCount.value=_reportList.value.length;
        update();

      }
      return _reportList.value;

    });
  }
  Future<void> deleteAllNotifications() async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('notification').get();

      for (DocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }

      _notificationList.value.clear();
      notificationCount.value = 0;
      update();

      Get.snackbar(
        "Success",
        "All notifications deleted",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to delete notifications: $error",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    }
  }
  Future<void> deleteAllReports() async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('reports').get();

      for (DocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }

      _reportList.value.clear();
      reportCount.value = 0;
      update();

      Get.snackbar(
        "Success",
        "All reports deleted",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to delete reports: $error",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    }
  }

}
