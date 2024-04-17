import 'package:flutter/material.dart';

import '../constants/colors.dart';
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.wSize, required this.btnText, required this.onTap,
  });

  final double wSize;

  final String btnText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wSize,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: "Kanit",
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: headerColor , width: 2),
          ),
          foregroundColor: Colors.white,
          backgroundColor: headerColor,
        ),
        onPressed: onTap,
        child:  FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            btnText,
            style: const TextStyle(fontFamily: "Kanit",fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
      ),
    );
  }
}