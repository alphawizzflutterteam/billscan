// To parse this JSON data, do
//
//     final qrDataModel = qrDataModelFromJson(jsonString);

import 'dart:convert';

QrDataModel qrDataModelFromJson(String str) => QrDataModel.fromJson(json.decode(str));

String qrDataModelToJson(QrDataModel data) => json.encode(data.toJson());

class QrDataModel {
  bool error;
  String message;
  List<Datum> data;

  QrDataModel({
    required this.error,
    required this.message,
    required this.data,
  });

  factory QrDataModel.fromJson(Map<String, dynamic> json) => QrDataModel(
    error: json["error"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))??[],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String invoiceNumber;
  DateTime generatedDate;
  String qr;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.invoiceNumber,
    required this.generatedDate,
    required this.qr,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    invoiceNumber: json["invoice_number"],
    generatedDate: DateTime.parse(json["generated_date"]),
    qr: json["qr"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice_number": invoiceNumber,
    "generated_date": "${generatedDate.year.toString().padLeft(4, '0')}-${generatedDate.month.toString().padLeft(2, '0')}-${generatedDate.day.toString().padLeft(2, '0')}",
    "qr": qr,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
