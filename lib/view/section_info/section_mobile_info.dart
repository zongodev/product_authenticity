import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_authenticity_fss/constants/colors.dart';

import '../../constants/const_padding.dart';

class SectionMobileInfo extends StatelessWidget {
  const SectionMobileInfo({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: defaultMobilePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/sectionimg.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          const SizedBox(height: 20,),
          const Text(
            "Simplifies the process of verifying the authenticity of,",
            style: TextStyle(
                fontFamily: "Kanit",
                color: Color(0xff4D4D4D),
                fontSize: 35,
                fontWeight: FontWeight.w700),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "chemistry products",
                textStyle: TextStyle(
                    fontFamily: "Kanit",
                    color: headerColor,
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Register now or log in to get started!",
            style: TextStyle(
                color: Color(0xff717171),
                fontSize: 20,
                fontFamily: "Kanit"),
          ),


        ],
      ),
    );
  }
}
