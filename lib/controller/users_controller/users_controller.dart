import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/models/notification_model.dart';
import 'package:product_authenticity_fss/models/users_model.dart';
import 'package:product_authenticity_fss/servises/users_service/user_service.dart';

class UsersController extends GetxController {
  final UsersService usersService = UsersService();
  final Rx<List<UserModel>> _allUsers = Rx<List<UserModel>>([]);
  final Rx<List<NotificationModel>> _allUserNotifications = Rx<List<NotificationModel>>([]);
  List<UserModel> get allUsers  => _allUsers.value;
  List<NotificationModel> get allUserNotifications  => _allUserNotifications.value;
  RxBool isLoading = true.obs;

  Future<void> fetchUsers() async {
    try {
      await usersService.getUsers().then((users) {
        for (var user in users) {
          _allUsers.value.add(UserModel.fromDocumentSnapshot(user));
          update();
        }
        EasyLoading.dismiss();
      });
    } on FirebaseException catch (e) {
      print("error firebase ${e.message}");
    } catch (e) {
      print("An unexpected error occurred: $e");
    }finally{
      isLoading.value=false;
      update();
    }
  }
  Future<void> fetchUserNotification(String userId) async {
    try {
      await usersService.getUserNotification(userId).then((notifications) {
        for (var notification in notifications) {
          _allUserNotifications.value.add(NotificationModel.fromDocumentSnapShot(notification));
          update();
        }
        EasyLoading.dismiss();
      });
    } on FirebaseException catch (e) {
      print("error firebase ${e.message}");
    } catch (e) {
      print("An unexpected error occurred: $e");
    }
  }
  @override
  void onInit(){
    super.onInit();
     fetchUsers();

  }
}