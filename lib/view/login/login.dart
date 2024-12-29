import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/constants/const_padding.dart';
import 'package:product_authenticity_fss/controller/auth/auth_controller.dart';

import 'package:product_authenticity_fss/view/login/widgets/login_text_field.dart';

import '../../constants/app_styles.dart';

import '../../shared/buttons.dart';

import '../../shared/signinbtn.dart';
import '../../utils/responsive.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;
    final AuthController authController = Get.find();
    return Padding(
      padding: !Responsive.isMobile(context)
          ? EdgeInsets.only(
              left: size.width * 0.2,
              right: size.width * 0.1,
            )
          : defaultMobilePadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                        fontFamily: "Oganesson",
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const Text(
                    "Please fill your detail to access your account.",
                    style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 15,
                        color: Color(0xff667085)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Email", style: loginLabelStyle),
                  ),
                  LoginTextField(
                    controller: emailController,
                    isPassword: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Password",
                      style: loginLabelStyle,
                    ),
                  ),
                  LoginTextField(
                    controller: passwordController,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Get.dialog(
                         Dialog(

                            surfaceTintColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: SizedBox(
                                width: 300,
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                        "Enter your email and we will send you a password reset link",style: navBarItemStyle,),
                                    SizedBox(height: 20,),
                                    TextFormField(
                                      controller: authController.resetController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Color(0xffD0D5DD), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffD0D5DD), width: 2),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "user@example.com",
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await authController
                                                .resetPass(authController.resetController.text);
                                          },
                                          child: const Text("Reset password")),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(fontFamily: "Oganesson")),
                      child: const Text("Forgot Password ?"),
                    ),
                  ),
                  AppButton(
                    btnText: 'Sign in',
                    onTap: () async {
                      EasyLoading.show(status: "loading ...");
                      await authController.login(
                          emailController.text, passwordController.text);
                    },
                    wSize: size.width,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          !Responsive.isMobile(context)
              ? Image.asset(
                  "assets/images/loginimg.png",
                  width: size.width * 0.4,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
