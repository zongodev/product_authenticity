import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/auth/auth_controller.dart';

import '../navigation_controller.dart';
import '../products/products_controller.dart';
import '../products/qr_code_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>QrCodeController());
    Get.put(NavigationController(),);
    Get.put(AuthController());





  }

}