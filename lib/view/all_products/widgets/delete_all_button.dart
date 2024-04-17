import 'package:flutter/material.dart';
import 'package:product_authenticity_fss/constants/app_styles.dart';

class DeleteAllButton extends StatelessWidget {
  const DeleteAllButton({
    super.key, required this.onPress,
  });
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.red.withOpacity(0.8),
          elevation: 0,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:  BorderSide(
              color: Colors.red.withOpacity(0.8),
            ),
          ),
        ),
        onPressed: onPress,
        icon:  Icon(Icons.delete,color: Colors.red.withOpacity(0.8),),
        label:  Text("Delete All",style: dialogButtons));
  }
}