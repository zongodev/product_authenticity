import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? reportTitle;
  final String? reportDesc;


  ReportModel({required this.reportTitle, required this.reportDesc,});

  factory ReportModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ReportModel(reportTitle: doc["reportTitle"], reportDesc: doc["reportDesc"]);
  }

}
