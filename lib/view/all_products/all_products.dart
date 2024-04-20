import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/constants/const_padding.dart';
import 'package:product_authenticity_fss/shared/signinbtn.dart';
import 'package:product_authenticity_fss/utils/responsive.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/custom_searchbar.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/delete_all_button.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/deletet_dialog.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/no_product.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/product_card.dart';

import '../../constants/app_styles.dart';
import '../../controller/products/products_controller.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          EasyLoading.show(status: "Loading products ...");
          return const SizedBox();
        } else if (controller.products.isEmpty) {
          EasyLoading.dismiss();
          return const NoProduct();
        } else {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !Responsive.isMobile(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSearchBar(
                              controller: controller,
                              width: size.width * 0.2,
                            ),
                            DeleteAllButton(
                              onPress: () {
                                Get.dialog(DeleteDialog(
                                  productName: "all products",
                                  onPressed: () async =>
                                      await controller.deleteAllProduct(),
                                ));
                              },
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSearchBar(
                              controller: controller,
                              width: size.width * 0.2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DeleteAllButton(
                              onPress: () {
                                Get.dialog(DeleteDialog(
                                  productName: "all products",
                                  onPressed: () async =>
                                      await controller.deleteAllProduct(),
                                ));
                              },
                            ),
                          ],
                        ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        String dataForQr =
                            "Name: ${controller.searchedProduct[index].productName!}\nCategory: ${controller.searchedProduct[index].category!}\nDescription: ${controller.searchedProduct[index].description!}";
                        return ProductCard(
                          dataForQr: dataForQr,
                          index: index,
                        );
                      },
                      itemCount: controller.searchedProduct.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: size.width ~/ 300,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 285 / 342),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
