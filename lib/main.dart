import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/controller/auth/auth_binding.dart';
import 'package:product_authenticity_fss/routes/apppages.dart';
import 'package:product_authenticity_fss/routes/routes.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      initialBinding: LoginBinding(),

      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    );
  }
}
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom

    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.black87
    ..indicatorColor = headerColor
    ..textColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}

