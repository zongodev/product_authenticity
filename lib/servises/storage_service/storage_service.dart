import 'dart:developer';
import 'dart:typed_data';


import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadImage(
    Uint8List image,
    String imageName,
  ) async {
    String uniqueImageId =
        "${DateTime.now().microsecondsSinceEpoch.toString()}$imageName";
    final uploaded = await storageRef
        .child("ProductsImages")
        .child(uniqueImageId)
        .putData(image);
    final imgUrl = await uploaded.ref.getDownloadURL();
    print(uploaded.ref.getDownloadURL());
    return imgUrl;
  }
}
