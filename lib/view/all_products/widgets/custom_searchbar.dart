import 'package:flutter/material.dart';
import 'package:product_authenticity_fss/controller/products/products_controller.dart';

import '../../../constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.width,
  });

  final ProductController controller;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 320,
      child: TextField(
        onChanged: (search) => controller.searchProduct(search),
        style: const TextStyle(height: 1),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffDCDEE3),
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: headerColor,
                  width: 2,
                )),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff9DA3B2),
            ),
            label: const FittedBox(
                fit: BoxFit.scaleDown, child: Text("Search product ...")),
            labelStyle:
                const TextStyle(color: Color(0xff727A90), fontFamily: "Kanit")),
      ),
    );
  }
}
