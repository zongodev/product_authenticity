import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_styles.dart';
import '../../../controller/products/products_controller.dart';
import '../../../models/product_model.dart';
import '../../../shared/back_dialog_button.dart';
import '../../../shared/custom_image_picker.dart';
import '../../add_product/widgets/add_product_text_field.dart';
class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    super.key,
    required this.size,

    required this.index, required this.onPress,
  });

  final Size size;

  final int index;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        "Update Product",
        style: navBarItemStyle.copyWith(fontSize: 20),
      ),
      content: SizedBox(
        width: size.width * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddProductTextField(
              textFieldName: 'ProductName',
              iconPath: Image.asset(
                'assets/icons/flask.png',
                width: 15,
              ),
              controller:
              productController.nameController.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
                return null; // Return null if validation succeeds
              },
            ),
            AddProductTextField(
              textFieldName: 'Category',
              iconPath: Image.asset(
                'assets/icons/cat.png',
                width: 15,
              ),
              controller:
              productController.catController.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product category';
                }
                return null; // Return null if validation succeeds
              },
            ),
            AddProductTextField(
              textFieldName: 'Description',
              iconPath: Image.asset(
                'assets/icons/desc.png',
                width: 15,
              ),
              controller:
              productController.descController.value, validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a product Description';
              }
              return null; // Return null if validation succeeds
            },
            ),
            CustomImagePicker(addProductController: productController,),
          ],
        ),
      ),
      actions: [
        const BackDialogButton(),
        ElevatedButton.icon(
          onPressed: onPress,
          icon: const Icon(Icons.update),
          label: const Text("Update"),
          style: ElevatedButton.styleFrom(
              surfaceTintColor: Colors.white,
              backgroundColor:
              Colors.green.withOpacity(0.8),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10)),
              textStyle: dialogButtons),
        ),
      ],
    );
  }
}