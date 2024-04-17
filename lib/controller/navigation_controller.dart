import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/routes/routes.dart';
import 'package:product_authenticity_fss/utils/responsive.dart';
import 'package:product_authenticity_fss/view/all_products/all_products.dart';
import 'package:product_authenticity_fss/view/section_info/section_info.dart';
import 'package:product_authenticity_fss/view/section_info/section_mobile_info.dart';

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
        return const AddProduct();
      case Routes.ALLPRODUCT:
        return const AllProducts();
      default:
        return const Responsive(mobileLayout: SectionMobileInfo(), webLayout:  SectionInfo());
    }
  }

}
