import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/notification_controller/notification_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }

}