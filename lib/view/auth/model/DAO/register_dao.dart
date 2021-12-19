// To parse this JSON data, do
//
//     final registerDao = registerDaoFromJson(jsonString);

import 'dart:convert';

RegisterDao registerDaoFromJson(String str) =>
    RegisterDao.fromJson(json.decode(str));

String registerDaoToJson(RegisterDao data) => json.encode(data.toJson());

class RegisterDao {
  RegisterDao({
    this.status,
    this.textFromApi,
    this.time,
  });

  bool? status;
  String? textFromApi;
  String? time;

  factory RegisterDao.fromJson(Map<String, dynamic> json) => RegisterDao(
        status: json["status"],
        textFromApi: json["textFromApi"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "textFromApi": textFromApi,
        "time": time,
      };
}
