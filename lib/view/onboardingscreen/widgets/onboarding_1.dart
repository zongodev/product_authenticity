import 'package:flutter/material.dart';
class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 6,
      child: Column(

        children: [
          SizedBox(height: 120,),
          Image.asset(
            "assets/images/onboarding2.gif",
            width: 200,
          ),
          Text(
            "Welcome to Authenticity Assurance",
            style: TextStyle(
                color: Color(0xff263238),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Kanit"),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Ensure the authenticity of your  products. Manage your products, generate QR codes, and stay updated with real-time notifications.",
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
