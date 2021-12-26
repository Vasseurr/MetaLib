// To parse this JSON data, do
//
//     final searchDao = searchDaoFromJson(jsonString);

import 'dart:convert';

import 'package:getx_starter/view/home/model/DTO/book_dto.dart';

SearchDao searchDaoFromJson(String str) => SearchDao.fromJson(json.decode(str));

String searchDaoToJson(SearchDao data) => json.encode(data.toJson());

class SearchDao {
  SearchDao({
    this.status,
    this.textFromApi,
    this.time,
    this.books,
  });

  bool? status;
  String? textFromApi;
  String? time;
  List<Book>? books;

  factory SearchDao.fromJson(Map<String, dynamic> json) => SearchDao(
        status: json["status"],
        textFromApi: json["textFromApi"],
        time: json["time"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "textFromApi": textFromApi,
        "time": time,
        "books": List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
