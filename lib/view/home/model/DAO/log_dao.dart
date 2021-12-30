// To parse this JSON data, do
//
//     final logDao = logDaoFromJson(jsonString);

import 'dart:convert';

import 'package:getx_starter/view/home/model/DTO/log_dto.dart';

LogDao logDaoFromJson(String str) => LogDao.fromJson(json.decode(str));

String logDaoToJson(LogDao data) => json.encode(data.toJson());

class LogDao {
  LogDao({this.status, this.textFromApi, this.time, this.logs, this.activeLib});

  bool? status;
  String? textFromApi;
  String? time;
  String? activeLib;
  List<Log>? logs;

  factory LogDao.fromJson(Map<String, dynamic> json) => LogDao(
        status: json["status"],
        textFromApi: json["textFromApi"],
        time: json["time"],
        activeLib: json["activeLib"],
        logs: List<Log>.from(json["logs"].map((x) => Log.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "textFromApi": textFromApi,
        "time": time,
        "activeLib": activeLib,
        "logs": List<dynamic>.from(logs!.map((x) => x.toJson())),
      };
}
