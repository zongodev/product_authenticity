import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_authenticity_fss/constants/colors.dart';
import 'package:product_authenticity_fss/controller/auth/auth_controller.dart';
import 'package:product_authenticity_fss/controller/navigation_controller.dart';
import 'package:product_authenticity_fss/controller/notification_controller/notification_controller.dart';
import 'package:product_authenticity_fss/view/navbar/Widgets/pop_up_report.dart';

import '../../constants/app_styles.dart';
import '../../constants/const_padding.dart';
import '../../controller/annimation_controller/annimation_controller.dart';
import '../../helper/on_hover_widget.dart';
import '../../models/notification_model.dart';
import '../../routes/routes.dart';
import '../../shared/signinbtn.dart';
import 'Widgets/pop_up_notifications.dart';
import 'Widgets/product_pop_up_menu.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final authController = Get.find<AuthController>();
    final NotificationController notificationController =
        Get.find();

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
                  //Image.asset("assets/images/lg.jpg",scale: 7.2,),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      "SECURA",
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
                      },
                      clr: headerColor,
                    )
                  : Row(
                      children: [
                        OnHoverWidget(
                            widget: Padding(
                          padding: defaultNavBarItemsPadding(context),
                          child: InkWell(
                            onTap: () {
                              navigationController.changeCurrentRoute(Routes.Users);

                            },
                            child: Text(
                              "Clients",
                              style: navBarItemStyle,
                            ),
                          ),
                        )),
                        OnHoverWidget(
                          widget: ProductPopUpMenu(),
                        ),
                        Padding(
                          padding: defaultNavBarItemsPadding(context),
                          child: StreamBuilder(
                            stream: notificationController.getNotifications(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              final notifications = snapshot.data;
                              if (notifications == null ||
                                  notifications.isEmpty) {
                                return const Text("No notifications found");
                              }

                              return PopUPNotifications(notifications: notifications);
                            },
                          ),
                        ),
                        Padding(
                          padding: defaultNavBarItemsPadding(context),
                          child: StreamBuilder(
                            stream: notificationController.getReport(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              final reports= snapshot.data;
                              if (reports == null ||
                                  reports.isEmpty) {
                                return const Text("No report found");
                              }

                              return PopUPReport( reports: reports);
                            },
                          ),
                        ),
                        SignInBtn(
                          wSize: 120,
                          btnText: 'Logout',
                          onTap: () async {
                            await authController.signOut();
                          },
                          clr: headerColor,
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

/*                        Padding(
                          padding: defaultNavBarItemsPadding(context),
                          child: PopupMenuButton(

                            constraints: BoxConstraints.expand(width: 500,height: 300),
                            tooltip: "Show notifications",
                            icon: Stack(
                              children: [
                                const Icon(Icons.notifications,size: 30,),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${notificationController.notificationCount.value}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: StreamBuilder(
                                    stream: notificationController
                                        .getNotifications(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            'Something went wrong');
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text("Loading");
                                      }

                                      final notifications = snapshot.data;
                                      if (notifications == null ||
                                          notifications.isEmpty) {
                                        return const Text(
                                            "No notifications found");
                                      }

                                      return Column(
                                        children:
                                        notifications.map((notification) {
                                          return PopupMenuItem(
                                            child: Text(notification.title ??
                                                "Notification"),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
*/
/*                        Padding(
                          padding: defaultNavBarItemsPadding(context),
                          child: StreamBuilder(
                            stream: notificationController.getNotifications(),
                            builder: (context, snapshot) {

                              if (snapshot.hasError) {

                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {

                                return CircularProgressIndicator();
                              }

                              final notifications = snapshot.data;
                              if (notifications == null ||
                                  notifications.isEmpty) {
                                return const Text("No notifications found");
                              }

                              return PopupMenuButton(
                                surfaceTintColor: Colors.white70,
                                elevation: 10,
                                constraints: BoxConstraints.expand(width: 500,height: 300),
                                tooltip: "Show notifications",
                                icon: Stack(
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      size: 30,
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '${notificationController.notificationCount.value}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                itemBuilder: (context) {
                                  return notifications.map((notification) {
                                    return PopupMenuItem(
                                      child: ListTile(
                                        title: Text(notification.title! ),
                                        subtitle: Text(notification.qrData!),
                                      ),
                                    );
                                  }).toList();
                                },
                              );
                            },
                          ),
                        ),
*/
