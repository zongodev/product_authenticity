import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/constants/app_styles.dart';
import 'package:product_authenticity_fss/models/product_model.dart';
import 'package:product_authenticity_fss/servises/products_service/products_service.dart';
import 'package:product_authenticity_fss/shared/signinbtn.dart';

class ProductController extends GetxController {
  final ProductService productService = ProductService();
  final Rx<List<ProductModel>> _productList = Rx<List<ProductModel>>([]);
  final Rx<List<ProductModel>> _searchedProductList = Rx<List<ProductModel>>([]);
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> catController = TextEditingController().obs;
  final Rx<TextEditingController> descController = TextEditingController().obs;

  List<ProductModel> get products => _productList.value;
  List<ProductModel> get searchedProduct => _searchedProductList.value;
  RxBool isLoading = true.obs;

  Future<void> getProducts() async {
    try {
      await productService.fetchProduct().then((value) {
        for (var element in value) {
          _productList.value.add(ProductModel.fromDocumentSnapshot(element));
        }
        EasyLoading.dismiss();
      });
    } on FirebaseException catch (e) {
      print("error firebase ${e.message}");
    } catch (e) {
      print("An unexpected error occurred: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> deleteProduct(String productId, String productName) async {
    try {
      await productService
          .deleteProduct(productId)
          .then((value) => Get.back());
      _searchedProductList.value
          .removeWhere((product) => product.uid == productId);
      update();
      Get.snackbar(
        "Success",
        "Product deleted successfully",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to delete product: $error",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    }

  }
  Future<void> deleteAllProduct() async {
    try {
      await productService
          .fetchProduct()
          .then((value) {
        for (var element in value) {
          element.reference.delete();
        }
        Get.back();
      });
      _searchedProductList.value.clear();

      update();
      Get.snackbar(
        "Success",
        "All Products deleted ",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to delete products: $error",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 40,
        ),
        maxWidth: 500,
        margin: const EdgeInsets.only(bottom: 10),
        colorText: Colors.white,
      );
    }

  }
  Future<void> addProduct(ProductModel product) async {
    try {
      await productService.addProduct(product).then((value) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Product Added !");
        nameController.value.clear();
        catController.value.clear();
        descController.value.clear();
      });
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Could not add the product", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }
  Future<void> updateProduct(String productId ,ProductModel product) async {
    try {
      await productService.updateProduct(productId,product).then((value) {
        EasyLoading.dismiss();
        Get.back();
        EasyLoading.showSuccess("Product updated !");
        final int index = _searchedProductList.value.indexWhere((element) => element.uid==productId);
        _searchedProductList.value[index]=product;
        update();
        nameController.value.clear();
        catController.value.clear();
        descController.value.clear();
      });
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Could not update the product", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }
  void searchProduct(String prod){
    List<ProductModel> results = [];
    if(prod.isEmpty){
      results=_productList.value;
      update();

    }else {
      results =  _productList.value.where((product) {
        final productName=product.productName!.toLowerCase();
        final input = prod.toLowerCase();
        return productName.contains(input);
      }).toList();
      update();

    }
    _searchedProductList.value=results;
  }

  @override
  void onInit() {
    super.onInit();
    _searchedProductList.value=_productList.value;
    getProducts();

  }
}
