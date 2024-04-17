import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_styles.dart';
import '../../../shared/back_dialog_button.dart';
class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key, required this.productName, required this.onPressed,

  });


  final String productName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        "Confirm Delete",
        style: navBarItemStyle.copyWith(fontSize: 20),
      ),
      content: Text(
        'Are you sure you want to delete $productName?\nThis action cannot be undone and the product will be hidden from users.',
        style: navBarItemStyle.copyWith(
            fontWeight: FontWeight.w300),
      ),
      actions: [
        const BackDialogButton(),
        ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.delete),
          label: const Text("Confirm"),
          style: ElevatedButton.styleFrom(
              surfaceTintColor: Colors.white,
              backgroundColor:
              Colors.red.withOpacity(0.8),
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

