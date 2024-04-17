import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/view/all_products/all_products.dart';
import '../../controller/navigation_controller.dart';
import '../navbar/navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController =
        Get.find<NavigationController>();
    return Scaffold(
      body: Column(
        children: [
          const  NavBar(),
          /*AllProducts(),*/
          Obx(() => navigationController.buildCurrentPage()),
        ],
      ),
    );
  }
}
