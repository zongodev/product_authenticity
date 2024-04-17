import 'package:get/get.dart';
import 'package:product_authenticity_fss/routes/routes.dart';
import 'package:product_authenticity_fss/view/add_product/add_product.dart';
import 'package:product_authenticity_fss/view/all_products/all_products.dart';
import 'package:product_authenticity_fss/view/login/login.dart';
import 'package:product_authenticity_fss/view/main_page/main_page.dart';
import 'package:product_authenticity_fss/view/test.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page:()=> const  Login()),
    GetPage(name: Routes.ADDPRODUCT, page:()=> const  AddProduct(),),
    GetPage(name: Routes.initial, page:()=> const  MainPage()),
    GetPage(name: Routes.ALLPRODUCT, page:()=> const  AllProducts()),
  ];
}