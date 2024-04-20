import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/models/product_model.dart';
import 'package:product_authenticity_fss/view/all_products/widgets/update_dialog.dart';

import '../../../constants/app_styles.dart';
import '../../../controller/products/products_controller.dart';
import '../../../controller/products/qr_code_controller.dart';
import '../../../helper/container_corner.dart';
import '../../../shared/signinbtn.dart';
import '../../add_product/widgets/add_product_text_field.dart';
import 'deletet_dialog.dart';
import 'details_dialog.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.dataForQr,
    required this.index,
  });

  final String dataForQr;

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productController = Get.find<ProductController>();
    Get.find<QrCodeController>();

    GlobalKey qrCodeKey = GlobalKey();

    return Card(
      surfaceTintColor: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxWidth * 0.7,
                    child: Card(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: RepaintBoundary(
                            key: qrCodeKey,
                            child: PrettyQrView.data(
                              data: dataForQr,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productController.searchedProduct[index].productName!,
                      style: navBarItemStyle.copyWith(color: headerColor),
                    ),
                    Text(
                      productController.searchedProduct[index].description!,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.6,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.dialog(DetailsDialog(
                                size: size,
                                index: index,
                                qrCodeKey: qrCodeKey));
                          },
                          label: const FittedBox(
                              fit: BoxFit.scaleDown, child: Text("Details")),
                          style: ElevatedButton.styleFrom(
                              surfaceTintColor: Colors.white,
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              textStyle: dialogButtons),
                          icon: const Icon(Icons.description_outlined),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () async {
                                    Get.dialog(
                                      DeleteDialog(
                                        productName: productController
                                            .searchedProduct[index]
                                            .productName!,
                                        onPressed: () async {
                                          await productController.deleteProduct(
                                              productController
                                                  .searchedProduct[index].uid!,
                                              productController
                                                  .searchedProduct[index]
                                                  .productName!);
                                        },
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  )),
                            ),

                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    productController.nameController.value.text =
                                        productController
                                            .searchedProduct[index].productName!;
                                    productController.catController.value.text =
                                        productController
                                            .searchedProduct[index].category!;
                                    productController.descController.value.text =
                                        productController
                                            .searchedProduct[index].description!;
                                    Get.dialog(
                                      UpdateDialog(
                                        size: size,
                                        index: index,
                                        onPress: () async {
                                          print("$index");
                                          EasyLoading.show(status: "loading ...");
                                          ProductModel editedProduct =
                                              ProductModel(
                                                  productName:
                                                      productController
                                                          .nameController
                                                          .value
                                                          .text,
                                                  category:
                                                      productController
                                                          .catController
                                                          .value
                                                          .text,
                                                  description: productController
                                                      .descController.value.text,
                                                  uid: productController
                                                      .searchedProduct[index]
                                                      .uid!);
                                          print("test the log $index");
                                          print(
                                              "test the log new ${productController.searchedProduct[index].uid}");
                                          await productController.updateProduct(
                                              productController
                                                  .searchedProduct[index].uid!,
                                              editedProduct);
                                        },
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

/*
* ListTile(
        leading: PrettyQrView.data(
          data: dataForQr,
        ),
        title:
        Text(controller.searchedProduct[index].productName!),
        subtitle:
        Text(controller.searchedProduct[index].description!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
                color: Color(0xff727A90)),
            IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await controller.deleteProduct(controller.searchedProduct[index].uid!,controller.searchedProduct[index].productName!);
                },
                color: Color(0xff727A90))
          ],
        ),
        onTap: () {
          print("tile number $index");
        },
      ),*/
