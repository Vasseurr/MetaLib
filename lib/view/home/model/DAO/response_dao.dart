// To parse this JSON data, do
//
//     final responseDao = responseDaoFromJson(jsonString);

import 'dart:convert';

ResponseDao responseDaoFromJson(String str) =>
    ResponseDao.fromJson(json.decode(str));

String responseDaoToJson(ResponseDao data) => json.encode(data.toJson());

class ResponseDao {
  ResponseDao({
    this.status,
    this.textFromApi,
    this.time,
  });

  bool? status;
  String? textFromApi;
  String? time;

  factory ResponseDao.fromJson(Map<String, dynamic> json) => ResponseDao(
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
