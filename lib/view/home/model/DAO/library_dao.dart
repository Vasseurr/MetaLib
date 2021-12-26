// To parse this JSON data, do
//
//     final libraryDao = libraryDaoFromJson(jsonString);

import 'dart:convert';

import 'package:getx_starter/view/home/model/DTO/library_dto.dart';

LibraryDao libraryDaoFromJson(String str) =>
    LibraryDao.fromJson(json.decode(str));

String libraryDaoToJson(LibraryDao data) => json.encode(data.toJson());

class LibraryDao {
  LibraryDao({
    this.status,
    this.textFromApi,
    this.time,
    this.libraries,
  });

  bool? status;
  String? textFromApi;
  String? time;
  List<Library>? libraries;

  factory LibraryDao.fromJson(Map<String, dynamic> json) => LibraryDao(
        status: json["status"],
        textFromApi: json["textFromApi"],
        time: json["time"],
        libraries: List<Library>.from(
            json["libraries"].map((x) => Library.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "textFromApi": textFromApi,
        "time": time,
        "libraries": List<dynamic>.from(libraries!.map((x) => x.toJson())),
      };
}
