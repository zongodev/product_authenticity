import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/controller/onboardingcontroller/on_boardinf_controller.dart';
import 'package:product_authenticity_fss/view/onboardingscreen/widgets/onboarding_1.dart';
import 'package:product_authenticity_fss/view/onboardingscreen/widgets/onboarding_2.dart';
import 'package:product_authenticity_fss/view/onboardingscreen/widgets/onboarding_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_styles.dart';
import '../../constants/const_padding.dart';
import '../../controller/navigation_controller.dart';
import '../../routes/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingController onBoardingController =
        Get.put(OnBoardingController());
    final  navigationController = Get.find<NavigationController>();

    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.936,
      height: size.height * 0.8,
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.1,
          left: size.width * 0.1,
          right: size.width * 0.1,
        ),
        child: Stack(
          children: [
            PageView(
              onPageChanged: (val) {
                onBoardingController.currentPage.value = val;
              },
              controller: onBoardingController.pageController,
              children: const [
                OnBoardingOne(),
                OnBoardingTwo(),
                OnBoardingThree(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Text(
                      "Skip",
                      style: navBarItemStyle,
                    ),
                    onTap: () {
                      onBoardingController.pageController.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(
                    controller: onBoardingController.pageController,
                    count: 3,
                    effect: WormEffect(activeDotColor: headerColor),
                    onDotClicked: (index) {
                      onBoardingController.pageController.jumpToPage(index);
                    },
                  ),
                  InkWell(
                    child: Obx(() => Text(
                          onBoardingController.currentPage.value == 2
                              ? "Done"
                              : "Next",
                          style: navBarItemStyle,
                        )),
                    onTap: () {
                      onBoardingController.currentPage.value == 2?navigationController.changeCurrentRoute(Routes.ADDPRODUCT):

                      onBoardingController.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
