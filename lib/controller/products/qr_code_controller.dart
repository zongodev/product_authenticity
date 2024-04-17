import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;
import 'package:get/get.dart';

class QrCodeController extends GetxController{
  RxString qrData = "".obs;


  void generateQr(String name ,String cat , String desc){
    qrData.value="Name: $name\nCategory: $cat\nDescription: $desc";
    update();
  }


  Future<Uint8List?> capturePng(GlobalKey key) async {
    RenderRepaintBoundary boundary =
    key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<void> downloadQrCodeImage(String qrCodeFileName,GlobalKey qrCodeKey)async{
    Uint8List? pngBytes =
    await capturePng(qrCodeKey);
    String base64Image = base64Encode(pngBytes!);

    html.AnchorElement(href: 'data:application/octet-stream;base64,$base64Image')
      ..setAttribute('download', '${qrCodeFileName}_qrcode.png')
      ..click();
  }

}