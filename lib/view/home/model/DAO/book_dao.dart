// To parse this JSON data, do
//
//     final bookDao = bookDaoFromJson(jsonString);

import 'dart:convert';

import 'package:getx_starter/view/home/model/DTO/book_dto.dart';

BookDao bookDaoFromJson(String str) => BookDao.fromJson(json.decode(str));

String bookDaoToJson(BookDao data) => json.encode(data.toJson());

class BookDao {
  BookDao({
    this.status,
    this.textFromApi,
    this.time,
    this.books,
  });

  bool? status;
  String? textFromApi;
  String? time;
  List<Book>? books;

  factory BookDao.fromJson(Map<String, dynamic> json) => BookDao(
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
