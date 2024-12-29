import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/users_controller/users_controller.dart';

class UsersBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }

}