import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_authenticity_fss/constants/const_padding.dart';
import 'package:product_authenticity_fss/controller/users_controller/users_controller.dart';
import 'package:product_authenticity_fss/models/users_model.dart';
import 'package:product_authenticity_fss/view/users/widgets/no_client.dart';

import '../../constants/app_styles.dart';
import '../all_products/widgets/no_product.dart';

class Users extends StatelessWidget {
  const Users({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<UsersController>(
      init: UsersController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          EasyLoading.show(status: "Loading clients ...");
          return const SizedBox();
        } else if (controller.allUsers.isEmpty) {
          EasyLoading.dismiss();
          return const NoClient();
        } else {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width ~/ 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 200 / 145),
                itemCount: controller.allUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  UserModel user = controller.allUsers[index];
                  return Card(
                    surfaceTintColor: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                  "assets/icons/user.png"
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(
                                    0xff00738C,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                onPressed: () async {
                                  await controller.fetchUserNotification(user.uid!);
                                  Get.dialog(
                                      PopScope(
                                        canPop: true,
                                        onPopInvoked: (_) {
                                          controller.allUserNotifications.clear();
                                        },
                                        child: AlertDialog(
                                          surfaceTintColor: Colors.white,
                                          title: Text(
                                            "${user.userName}'s Scan History",
                                            style: navBarItemStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          content: SizedBox(
                                            width: 300,
                                            height: 400,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "List of QR codes scanned by ${user.userName}:",
                                                  style: navBarItemStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                                                ),
                                                const SizedBox(height: 10),
                                                controller.allUserNotifications.isNotEmpty?
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: controller.allUserNotifications.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "${controller.allUserNotifications[index].qrData}",
                                                            style: navBarItemStyle.copyWith(fontSize: 14),
                                                          ),
                                                          Divider(color: Colors.grey),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ):Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,

                                                  children: [
                                                    Image.asset("assets/images/emptynoti.png"),
                                                    Text(
                                                      "No QR codes scanned by ${user.userName}.",
                                                      style: navBarItemStyle.copyWith(fontSize: 18),

                                                    ),
                                                  ],
                                                ),
                                                // ElevatedButton(onPressed: (){}, child: Text("delete"))
                                              ],
                                            ),
                                          ),

                                        ),
                                      ),

                                  );
                                },
                                child: Text(
                                  "History",
                                  style: dialogButtons.copyWith(
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(user.userName!,style: navBarItemStyle),

                          Text(user.email!,style:navBarItemStyle.copyWith(
                              fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
/*
* ListTile(
                    title: Text(user.userName!),
                    subtitle: Text(user.email!),
                    trailing: SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.fetchUserNotification(user.uid!);
                          Get.dialog(
                            AlertDialog(
                              surfaceTintColor: Colors.white,
                              title: Text(
                                "dddd",
                                style: navBarItemStyle.copyWith(fontSize: 20),
                              ),
                              content: SizedBox(
                                width: 200,
                                height: 300,
                                child: ListView.builder(
                                  itemCount:
                                      controller.allUserNotifications.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Text(
                                        "${controller.allUserNotifications[index].qrData}");
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text("view unauthenticated product scanned "),
                      ),
                    ),
                  ),*/
