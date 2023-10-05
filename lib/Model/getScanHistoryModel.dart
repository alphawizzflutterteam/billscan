// To parse this JSON data, do
//
//     final scannHistory = scannHistoryFromJson(jsonString);

import 'dart:convert';

ScannHistory scannHistoryFromJson(String str) => ScannHistory.fromJson(json.decode(str));

String scannHistoryToJson(ScannHistory data) => json.encode(data.toJson());

class ScannHistory {
  bool error;
  String message;
  List<Datum> data;

  ScannHistory({
    required this.error,
    required this.message,
    required this.data,
  });

  factory ScannHistory.fromJson(Map<String, dynamic> json) => ScannHistory(
    error: json["error"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String userId;
  String qrId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String qr;
  DateTime generatedDate;
  String invoiceNumber;

  Datum({
    required this.id,
    required this.userId,
    required this.qrId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.qr,
    required this.generatedDate,
    required this.invoiceNumber,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    qrId: json["qr_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    qr: json["qr"],
    generatedDate: DateTime.parse(json["generated_date"]),
    invoiceNumber: json["invoice_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "qr_id": qrId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "qr": qr,
    "generated_date": "${generatedDate.year.toString().padLeft(4, '0')}-${generatedDate.month.toString().padLeft(2, '0')}-${generatedDate.day.toString().padLeft(2, '0')}",
    "invoice_number": invoiceNumber,
  };
}
