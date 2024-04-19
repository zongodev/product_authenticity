import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_styles.dart';
import '../../../controller/products/products_controller.dart';
import '../../../controller/products/qr_code_controller.dart';
import '../../../shared/signinbtn.dart';
class DetailsDialog extends StatelessWidget {
  const DetailsDialog({
    super.key,
    required this.size,

    required this.index,
    required this.qrCodeKey,
  });

  final Size size;

  final int index;
  final GlobalKey<State> qrCodeKey;

  @override
  Widget build(BuildContext context) {
    final qrCodeController = Get.find<QrCodeController>();
    final productController = Get.find<ProductController>();
    return AlertDialog(

      surfaceTintColor: Colors.white,
      title: Text(
        "Details",
        style: navBarItemStyle.copyWith(fontSize: 20),
      ),
      content: SizedBox(
        width: size.width*0.2,
        height: size.height*0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Product name :",
              style: navBarItemStyle.copyWith(fontSize: 18),
            ),
            Text(
                productController.searchedProduct[index].productName!,style: detailsDialogTextStyle),
            Text(
              "Product category :",
              style: navBarItemStyle.copyWith(fontSize: 18),
            ),
            Text(
              productController.searchedProduct[index].category!,style: detailsDialogTextStyle,),
            Text(
              "Description :",
              style: navBarItemStyle.copyWith(fontSize: 18),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  productController.searchedProduct[index].description!,style: detailsDialogTextStyle,),
              ),
            ),
            SizedBox(height: size.height*0.016,),
            SignInBtn(
              wSize: size.width,
              btnText: 'Export Qr code',
              onTap: () async {
                await qrCodeController.downloadQrCodeImage(
                    productController.searchedProduct[index].productName!,
                    qrCodeKey);
              }, clr: Colors.blueAccent,
            ),

          ],
        ),
      ),
    );
  }
}