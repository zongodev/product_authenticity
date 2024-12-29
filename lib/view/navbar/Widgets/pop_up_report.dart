import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:product_authenticity_fss/constants/app_styles.dart';
import 'package:product_authenticity_fss/controller/notification_controller/notification_controller.dart';
import 'package:product_authenticity_fss/models/reportmodel.dart';

import '../../../models/notification_model.dart';

class PopUPReport extends StatelessWidget {
  const PopUPReport({
    super.key,
    required this.reports,
  });

  final List<ReportModel>? reports;

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.find<NotificationController>();

    return PopupMenuButton(
      surfaceTintColor: Colors.white70,
      elevation: 10,
      constraints: const BoxConstraints.expand(width: 700, height: 300),
      tooltip: "Show reports",
      icon: Stack(
        children: [
          const Icon(
            Icons.report_rounded,
            size: 30,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${notificationController.reportCount.value}',
                style: const TextStyle(
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
          ...reports!.map((report) {
            return PopupMenuItem(
              child: ListTile(
               // onTap: () => _copyTextToClipboard(context, report.userEmail!),
                leading: CircleAvatar(
                  child: Icon(Icons.report),
                ),
                title: Text(
                  report.reportTitle!,
                  style: navBarItemStyle,
                ),
                subtitle: Text(report.reportDesc!),
                /*trailing: InkWell(
                  onTap: () => _showQrCode(context, notification.qrData!),
                  child: PrettyQrView.data(
                    data: notification.qrData!,
                  ),
                ),*/
              ),
            );
          }).toList(),
          PopupMenuItem(
            enabled: false,
            child: TextButton(
              onPressed: () async{
                await notificationController.deleteAllReports();
              },
              child: Text(
                'Delete All',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }

  void _showQrCode(BuildContext context, String qrData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Scanned QR Code",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: PrettyQrView.data(
                    data: qrData,
                  ),
                ),
                /*  const SizedBox(height: 20),
                Text(
                  qrData,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "This is the QR code scanned by the client.",
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),*/
              ],
            ),
          ),
        );
      },
    );
  }

  void _copyTextToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email Copied'),

      ),
    );
  }
}
