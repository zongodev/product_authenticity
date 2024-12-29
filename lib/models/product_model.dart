import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? uid;
  final String? productId;
  final String? productName;
  final String? category;
  final String? description;
  final String? imageUrl;

  ProductModel(
      {required this.productName,
      required this.category,
      required this.description,
       this.uid,this.imageUrl,this.productId,});

  factory ProductModel.fromDocumentSnapshot(
      DocumentSnapshot doc) {
    return ProductModel(
        productName: doc["productName"],
        category: doc["category"],
        description: doc["description"],
        uid: doc.id,
        imageUrl: doc["imageUrl"],
        productId: doc["productId"]
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "productName":productName,
      "category":category,
      "description" : description,
      "imageUrl": imageUrl,
      "productId":productId

    };
  }
}
