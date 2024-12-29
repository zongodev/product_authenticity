import 'package:flutter/material.dart';
class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 6,
      child: Column(

        children:  [
          SizedBox(height: 120,),
          Image.asset(
            "assets/images/onboarding1.gif",
            width: 200,
          ),
          Text(
            "Generate and Manage QR Codes",
            style: TextStyle(
                color: Color(0xff263238),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Kanit"),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Easily add your products and generate unique QR codes. View and manage all your products in one place.",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff263238),
              fontFamily: "Kanit",
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
