import 'package:get/get.dart';

class CustomAnimationController extends GetxController {
  RxBool isHovered = false.obs;

  void enEnter(bool hovered) {
    isHovered.value=hovered;
    update();
  }
}