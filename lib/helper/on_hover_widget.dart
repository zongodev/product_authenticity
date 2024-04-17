import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/controller/annimation_controller/annimation_controller.dart';


class OnHoverWidget extends StatelessWidget {
   const OnHoverWidget({super.key, required this.widget});

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final animationController = CustomAnimationController();

    final hoveredTransform = Matrix4.identity()..translate(0,-5,0);
    return MouseRegion(
      onEnter: (event) => animationController.enEnter(true),
      onExit: (event) => animationController.enEnter(false),
      child: Obx(
        () =>  AnimatedContainer(
          curve: Curves.easeInSine,
          transform: animationController.isHovered.value?hoveredTransform:Matrix4.identity(),
            duration: const Duration(milliseconds: 200), child: widget),
      ),
    );
  }
}
