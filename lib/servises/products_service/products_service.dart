import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_authenticity_fss/models/product_model.dart';

class ProductService {
final CollectionReference _productCollectionReference = FirebaseFirestore.instance.collection("products");

Future<void> addProduct(ProductModel product) async{
  await _productCollectionReference.add(product.toMap());

}

Future<List<QueryDocumentSnapshot>>  fetchProduct() async {
  var data = await _productCollectionReference
      .get();
  return data.docs;

}

Future<void> deleteProduct(String id) async {
  await _productCollectionReference.doc(id).delete();
}
Future<void> updateProduct(String id , ProductModel editedProduct) async {
  await _productCollectionReference.doc(id).update(editedProduct.toMap());
}


}