import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final PageController _pageController = PageController();
   PageController get pageController => _pageController;
   RxInt currentPage = 0.obs;

}