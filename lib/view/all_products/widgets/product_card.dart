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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.dataForQr,
    required this.controller,
    required this.index,
  });

  final String dataForQr;
  final ProductController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final qrCodeController = Get.find<QrCodeController>();
    GlobalKey qrCodeKey =GlobalKey();

    return Card(
      surfaceTintColor: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.12,
              height: size.height * 0.2,
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.searchedProduct[index].productName!,
                  style: navBarItemStyle.copyWith(color: headerColor),
                ),
                Text(
                  controller.searchedProduct[index].description!,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      actions: [
                        SignInBtn(
                          wSize: size.width*0.2,
                          btnText: 'Export Qr code',
                          onTap: () async {
                            await qrCodeController.downloadQrCodeImage(
                                controller.searchedProduct[index].productName!,
                                qrCodeKey);
                          }, clr: Colors.blueAccent,
                        ),
                      ],
                      surfaceTintColor: Colors.white,
                      title: Text(
                        "Details",
                        style: navBarItemStyle.copyWith(fontSize: 20),
                      ),
                      content: SizedBox(
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product name :",
                              style: navBarItemStyle.copyWith(fontSize: 18),
                            ),
                            Text(
                                controller.searchedProduct[index].productName!,style: detailsDialogTextStyle),
                            Text(
                              "Product category :",
                              style: navBarItemStyle.copyWith(fontSize: 18),
                            ),
                            Text(
                                controller.searchedProduct[index].category!,style: detailsDialogTextStyle,),
                            Text(
                              "Description :",
                              style: navBarItemStyle.copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                    controller.searchedProduct[index].description!,style: detailsDialogTextStyle,),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ));
                  },
                  label: const Text("Details"),
                  style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: dialogButtons),
                  icon: const Icon(Icons.description_outlined),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          Get.dialog(
                            DeleteDialog(
                              productName: controller
                                  .searchedProduct[index].productName!,
                              onPressed: () async {
                                await controller.deleteProduct(
                                    controller.searchedProduct[index].uid!,
                                    controller
                                        .searchedProduct[index].productName!);
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete)),
                    IconButton(
                        onPressed: () {
                          controller.nameController.value.text =
                              controller.searchedProduct[index].productName!;
                          controller.catController.value.text =
                              controller.searchedProduct[index].category!;
                          controller.descController.value.text =
                              controller.searchedProduct[index].description!;
                          Get.dialog(
                            UpdateDialog(
                              size: size,
                              controller: controller,
                              index: index,
                              onPress: () async {
                                EasyLoading.show(status: "loading ...");
                                ProductModel editedProduct = ProductModel(
                                    productName:
                                        controller.nameController.value.text,
                                    category:
                                        controller.catController.value.text,
                                    description:
                                        controller.descController.value.text);
                                await controller.updateProduct(
                                    controller.searchedProduct[index].uid!,
                                    editedProduct);
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ],
            )
          ],
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
