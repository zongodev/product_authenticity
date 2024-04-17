import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_authenticity_fss/view/navbar/navbar.dart';

import '../controller/auth/auth_controller.dart';
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController =Get.put(AuthController());

    return Center(child: Text(authController.user.value!.email.toString()),);

  }
}
