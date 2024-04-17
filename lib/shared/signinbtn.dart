

import 'package:flutter/material.dart';
import 'package:product_authenticity_fss/constants/app_styles.dart';

import '../constants/colors.dart';
class SignInBtn extends StatelessWidget {
  const SignInBtn({
    super.key,
    required this.wSize, required this.btnText, required this.onTap, this.icon, required this.clr,

  });

  final double wSize;
  final String btnText;
  final Function() onTap;
  final Widget? icon;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wSize,
      height: 44,
      child: ElevatedButton.icon(

        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: clr , width: 2),
          ),
          surfaceTintColor: clr,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onTap,
        icon: icon ?? const SizedBox(),
        label:  FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            btnText,
            style:  TextStyle(fontFamily: "Kanit",fontWeight: FontWeight.bold,fontSize: 19,color: clr),
          ),
        ),
      ),
    );
  }
}
