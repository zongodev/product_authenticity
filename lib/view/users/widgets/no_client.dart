import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';
class NoClient extends StatelessWidget {
  const NoClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/emptyuser.png"),
          Text(
            "Oops! It seems there are no client available.",
            style: navBarItemStyle.copyWith(fontSize: 25),
          ),
        ],
      ),
    );
  }
}