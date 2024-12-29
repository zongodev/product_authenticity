import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:product_authenticity_fss/controller/navigation_controller.dart';
import 'package:product_authenticity_fss/routes/routes.dart';
import 'package:product_authenticity_fss/servises/auth_service/auth_service.dart';
import 'package:product_authenticity_fss/view/test.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final  navigationController = Get.find<NavigationController>();

  final Stream<User?> userStream = FirebaseAuth.instance.authStateChanges();
  late String errorMessage;
  Rx<User?> user = Rx<User?>(null);
  final TextEditingController resetController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    userStream.listen((user) {
      this.user.value = user;
      if(user != null){
        navigationController.changeCurrentRoute(Routes.onBoarding);
        update();
      }else {
        navigationController.changeCurrentRoute(Routes.initial);
        update();

      }
    });
  }

  Future<void> login(String email, String password) async {
    try {
      EasyLoading.show(status: "Checking credentials...");
      bool isAdmin = await _authService.isAdminEmail(email);
      EasyLoading.dismiss();

      if (isAdmin) {
        EasyLoading.show(status: "Logging in...");
        UserCredential authResult = await _authService.loginAdmin(email, password);
        if (authResult.user != null) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Login Successful!");
          navigationController.currentRoute(Routes.onBoarding);
          update();
        }
      } else {
        EasyLoading.dismiss();
        Get.snackbar("Permission Denied", "You do not have permission to access this account.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 7),
            icon: const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
            maxWidth: 500,
            margin: const EdgeInsets.only(bottom: 10),
            backgroundColor: const Color(0xffE6284A),
            colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
      switch (e.code) {
        case "invalid-credential":
          errorMessage = 'Invalid email or password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'missing-email':
          errorMessage = 'Please enter your email address.';
          break;
        case 'missing-password':
          errorMessage = 'Please enter your password.';
          break;
        case 'network-request-failed':
          errorMessage = 'A network error occurred. Please check your connection and try again.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }
      EasyLoading.dismiss();
      Get.snackbar("Could not sign in", errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Could not sign in", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<void> resetPass(String email) async {
    try {
     
      await _authService.resetPass(email).then((value) {
        resetController.clear();
        Get.back();
        return Get.snackbar("Success", "A password reset link has been sent to your email. Please check your inbox.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: Colors.green,
          colorText: Colors.white);
      },);
    
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }

}
