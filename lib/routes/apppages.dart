import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/notification_controller/notification_binding.dart';
import 'package:product_authenticity_fss/controller/users_controller/users_binding.dart';
import 'package:product_authenticity_fss/routes/routes.dart';
import 'package:product_authenticity_fss/view/add_product/add_product.dart';
import 'package:product_authenticity_fss/view/all_products/all_products.dart';
import 'package:product_authenticity_fss/view/login/login.dart';
import 'package:product_authenticity_fss/view/main_page/main_page.dart';
import 'package:product_authenticity_fss/view/onboardingscreen/onboarding_screen.dart';
import 'package:product_authenticity_fss/view/test.dart';
import 'package:product_authenticity_fss/view/users/users.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page:()=> const  Login()),
    GetPage(name: Routes.ADDPRODUCT, page:()=> const  AddProduct(),),
    GetPage(name: Routes.initial, page:()=> const  MainPage(),bindings: [NotificationBinding(),]),
    GetPage(name: Routes.ALLPRODUCT, page:()=> const  AllProducts()),
    GetPage(name: Routes.Users, page:()=> const  Users(),binding: UsersBinding()),
    GetPage(name: Routes.onBoarding, page:()=> const  OnBoardingScreen(),),
  ];
}