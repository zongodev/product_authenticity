import 'package:flutter/material.dart';
class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.mobileLayout, required this.webLayout});
  final Widget mobileLayout;
  final Widget webLayout;

  static bool isMobile(BuildContext context){
    return MediaQuery.sizeOf(context).width <= 800;
  }
  


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<800){
        return mobileLayout;
      }else {
        return webLayout;
      }
    },);
  }
}
