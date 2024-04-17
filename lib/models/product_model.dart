import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? uid;
  final String? productName;
  final String? category;
  final String? description;

  ProductModel(
      {required this.productName,
      required this.category,
      required this.description,
       this.uid});

  factory ProductModel.fromDocumentSnapshot(
      DocumentSnapshot doc) {
    return ProductModel(
        productName: doc["productName"],
        category: doc["category"],
        description: doc["description"],
        uid: doc.id);
  }

  Map<String,dynamic> toMap(){
    return {
      "productName":productName,
      "category":category,
      "description" : description,
    };
  }
}
