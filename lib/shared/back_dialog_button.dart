import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app_styles.dart';
class BackDialogButton extends StatelessWidget {
  const BackDialogButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.cancel),
      label: const Text("Cancel"),
      style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10.0),
          ),
          textStyle: dialogButtons),
    );
  }
}