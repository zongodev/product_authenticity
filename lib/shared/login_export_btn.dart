import 'package:flutter/material.dart';

import '../constants/colors.dart';
class LoginAndExportBtn extends StatelessWidget {
  const LoginAndExportBtn({
    super.key,
    required this.size, required this.btnText, required this.onTap,
  });

  final Size size;
  final String btnText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02),
        height: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: headerColor,
              width: 2,
            )),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: headerColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}