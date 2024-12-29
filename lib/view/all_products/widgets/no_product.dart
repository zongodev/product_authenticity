import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';
class NoProduct extends StatelessWidget {
  const NoProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty.png"),
          Text(
            "Oops! It seems there are no product available.",
            style: navBarItemStyle.copyWith(fontSize: 25),
          ),
        ],
      ),
    );
  }
}