import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/products/products_controller.dart';

import '../../../constants/app_styles.dart';
import '../../../constants/const_padding.dart';
import '../../../controller/navigation_controller.dart';
import '../../../routes/routes.dart';
class ProductPopUpMenu extends StatelessWidget {
   ProductPopUpMenu({
    super.key,

  });
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultNavBarItemsPadding(context),
      child: PopupMenuButton(
        tooltip: "Show products menu",
        surfaceTintColor: Colors.white,
        child: Text(
          "Products",
          style: navBarItemStyle,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: const Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "All Products",
                    style: TextStyle(
                        fontFamily: "Kanit",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                navigationController
                  .changeCurrentRoute(Routes.ALLPRODUCT);
               Get.delete<ProductController>();
              },
            ),
            PopupMenuItem(
              child: const Row(
                children: [
                  Icon(Icons.add_box_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add Product",
                    style: TextStyle(
                        fontFamily: "Kanit",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                navigationController
                  .changeCurrentRoute(Routes.ADDPRODUCT);

              },
            )
          ];
        },
      ),
    );
  }
}