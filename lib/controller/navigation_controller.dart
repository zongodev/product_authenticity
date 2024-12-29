import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/routes/routes.dart';
import 'package:product_authenticity_fss/utils/responsive.dart';
import 'package:product_authenticity_fss/view/add_product/add_product_mobile.dart';
import 'package:product_authenticity_fss/view/all_products/all_products.dart';
import 'package:product_authenticity_fss/view/onboardingscreen/onboarding_screen.dart';
import 'package:product_authenticity_fss/view/section_info/section_info.dart';
import 'package:product_authenticity_fss/view/section_info/section_mobile_info.dart';
import 'package:product_authenticity_fss/view/users/users.dart';

import '../view/add_product/add_product.dart';
import '../view/login/login.dart';
import '../view/test.dart';

class NavigationController extends GetxController{

  final RxString currentRoute = Routes.initial.obs;
  void changeCurrentRoute (String newRoute){
    currentRoute.value=newRoute;
    update();
  }
  Widget buildCurrentPage() {
    switch (currentRoute.value) {
      case Routes.LOGIN:
        return const Login();
      case Routes.ADDPRODUCT:
        return const Responsive(mobileLayout: AddProductMobile(), webLayout:  AddProduct());
      case Routes.ALLPRODUCT:
        return const AllProducts();
      case Routes.Users:
        return const Users();
      case Routes.onBoarding:
        return const OnBoardingScreen();
      default:
        return const Responsive(mobileLayout: SectionMobileInfo(), webLayout:  SectionInfo());
    }
  }


}
