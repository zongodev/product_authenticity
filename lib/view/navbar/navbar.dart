import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/controller/auth/auth_controller.dart';
import 'package:product_authenticity_fss/controller/navigation_controller.dart';

import '../../constants/app_styles.dart';
import '../../constants/const_padding.dart';
import '../../controller/annimation_controller/annimation_controller.dart';
import '../../helper/on_hover_widget.dart';
import '../../routes/routes.dart';
import '../../shared/signinbtn.dart';
import 'Widgets/product_pop_up_menu.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final authController = Get.find<AuthController>();

    return Material(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: headerColor,
                    ),
                    child: const Center(
                      child: Text(
                        "AA",
                        style: TextStyle(
                          fontFamily: "Oganesson",
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      "Authenticity Assurance",
                      style: TextStyle(
                          color: Color(0xff263238),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Kanit"),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => authController.user.value == null
                  ? SignInBtn(
                      wSize: 120,
                      btnText: 'Login',
                      onTap: () {
                        navigationController.changeCurrentRoute(Routes.LOGIN);
                      }, clr: headerColor,
                    )
                  : Row(
                      children: [
                        OnHoverWidget(
                            widget: Padding(
                              padding:defaultNavBarItemsPadding(context),
                              child: InkWell(onTap: () {  },
                                child:  Text("Clients",style: navBarItemStyle,),),
                            )
                        ),
                        OnHoverWidget(
                          widget: ProductPopUpMenu(),
                        ),


                        SignInBtn(
                          wSize: 120,
                          btnText: 'Logout',
                          onTap: () async {
                            await authController.signOut();
                          }, clr: headerColor,
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
