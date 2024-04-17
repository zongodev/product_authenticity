import 'package:flutter/material.dart';

EdgeInsets defaultWebPadding(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: size.height * 0.23,
    left: size.width * 0.1,
    right: size.width * 0.1,
  );
}
EdgeInsets defaultMobilePadding(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return EdgeInsets.only(
    top: size.height * 0.1,
    left: size.width * 0.04,
  );
}

EdgeInsets defaultNavBarItemsPadding(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return EdgeInsets.only(
   right: size.width*0.02
  );
}
