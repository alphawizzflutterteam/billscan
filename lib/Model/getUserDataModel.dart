// To parse this JSON data, do
//
//     final getUserData = getUserDataFromJson(jsonString);

import 'dart:convert';

GetUserData getUserDataFromJson(String str) =>
    GetUserData.fromJson(json.decode(str));

String getUserDataToJson(GetUserData data) => json.encode(data.toJson());

class GetUserData {
  bool error;
  String message;
  List<Datum> data;

  GetUserData({
    required this.error,
    required this.message,
    required this.data,
  });

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
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
  String username;
  String? email;
  String mobile;
  String technicianType;
  String address;
  DateTime dob;
  String registrationNumber;
  String adharNumber;
  String pancardNumber;
  String accountNumber;
  String ifscCode;
  String bankPassbook;
  String staffImg;
  String pancardImg;
  String adharBackImg;
  String adharFrontImg;
  String active;

  Datum({
    required this.username,
    this.email,
    required this.mobile,
    required this.technicianType,
    required this.address,
    required this.dob,
    required this.registrationNumber,
    required this.adharNumber,
    required this.pancardNumber,
    required this.accountNumber,
    required this.ifscCode,
    required this.bankPassbook,
    required this.staffImg,
    required this.pancardImg,
    required this.adharBackImg,
    required this.adharFrontImg,
    required this.active,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        technicianType: json["technician_type"],
        address: json["address"],
        dob: DateTime.parse(json["dob"]),
        registrationNumber: json["registration_number"],
        adharNumber: json["adhar_number"],
        pancardNumber: json["pancard_number"],
        accountNumber: json["account_number"],
        ifscCode: json["ifsc_code"],
        bankPassbook: json["bank_passbook"],
        staffImg: json["staff_img"],
        pancardImg: json["pancard_img"],
        adharBackImg: json["adhar_back_img"],
        adharFrontImg: json["adhar_front_img"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "mobile": mobile,
        "technician_type": technicianType,
        "address": address,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "registration_number": registrationNumber,
        "adhar_number": adharNumber,
        "pancard_number": pancardNumber,
        "account_number": accountNumber,
        "ifsc_code": ifscCode,
        "bank_passbook": bankPassbook,
        "staff_img": staffImg,
        "pancard_img": pancardImg,
        "adhar_back_img": adharBackImg,
        "adhar_front_img": adharFrontImg,
        "active": active,
      };
}
