import 'package:flutter/material.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 6,
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Image.asset(
            "assets/images/onboarding3.gif",
            width: 200,
          ),
          Text(
            "Stay Informed",
            style: TextStyle(
                color: Color(0xff263238),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Kanit"),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Receive notifications when a client scans an unauthenticated product. Get detailed information about the scanned QR code.",
            style:  TextStyle(
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
