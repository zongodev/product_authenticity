import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:product_authenticity_fss/constants/app_styles.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/controller/products/qr_code_controller.dart';
import 'package:product_authenticity_fss/models/product_model.dart';
import 'package:product_authenticity_fss/view/add_product/widgets/add_product_text_field.dart';

import '../../constants/const_padding.dart';
import '../../controller/products/products_controller.dart';
import '../../helper/container_corner.dart';
import '../../shared/buttons.dart';

import '../../shared/custom_image_picker.dart';
import '../../shared/signinbtn.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey qrCodeKey = GlobalKey();
    final size = MediaQuery.of(context).size;

    final qrCodeController = Get.find<QrCodeController>();
    final addProductController =
        Get.put<ProductController>(ProductController());
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: defaultWebPadding(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Add Product Information and Generate ",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "Oganesson",
                              color: Color(0xff263231)),
                        ),
                        TextSpan(
                          text: "QR Codes",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "Oganesson",
                              color: headerColor),
                        ),
                      ]),
                    ),
                  ),
                  AddProductTextField(
                    textFieldName: 'ProductName',
                    iconPath: Image.asset(
                      'assets/icons/flask.png',
                      width: 15,
                    ),
                    controller: addProductController.nameController.value, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product Description';
                    }
                    return null;
                  },
                  ),
                  AddProductTextField(
                    textFieldName: 'Category',
                    iconPath: Image.asset(
                      'assets/icons/cat.png',
                      width: 15,
                    ),
                    controller: addProductController.catController.value, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product Description';
                    }
                    return null;
                  },
                  ),
                  AddProductTextField(
                    textFieldName: 'Description',
                    iconPath: Image.asset(
                      'assets/icons/desc.png',
                      width: 15,
                    ),
                    controller: addProductController.descController.value, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product Description';
                    }
                    return null;
                  },
                  ),
                  CustomImagePicker(addProductController: addProductController),
                  Obx(() {
                    final webImage = addProductController.webImage.value;




                      if (webImage.isNotEmpty) {
                        return Text("image picked ");
                      } else {
                        return Text("no image picked yet");
                      }

                  }),

                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      AppButton(
                        btnText: 'Save & Generate QR Code',
                        onTap: () async {
                          EasyLoading.show(status: "loading ...");
                          if(_formKey.currentState!.validate()&&addProductController.webImage.value.isNotEmpty){
                          await addProductController.addProduct();
                          await qrCodeController.generateQr(
                              addProductController.nameController.value.text,
                              addProductController.catController.value.text,
                              addProductController.descController.value.text,
                            addProductController.productId.value,
                          );

                          addProductController.clearFiled();}else{
                            EasyLoading.dismiss();
                            EasyLoading.showError("remplir all the champs");
                          }


                        },
                        wSize: size.width * 0.2,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SignInBtn(
                        wSize: size.width * 0.11,
                        btnText: 'Export',
                        onTap: () async {
                          await qrCodeController.downloadQrCodeImage(
                              addProductController.nameController.value.text,
                              qrCodeKey);
                        },
                        clr: headerColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size.width * 0.17,
                height: size.height * 0.33,
                child: CustomPaint(
                  foregroundPainter: BorderPainter(),
                ),
              ),
              RepaintBoundary(
                key: qrCodeKey,
                child: Obx(
                  () => SizedBox(
                    width: size.width * 0.14,
                    height: size.height * 0.25,
                    child: Center(
                      child: PrettyQrView.data(
                        data: qrCodeController.qrData.value,

                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

