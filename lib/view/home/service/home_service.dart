import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_starter/core/constants/app_constants.dart';
import 'package:getx_starter/view/home/model/DAO/book_dao.dart';
import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/DAO/log_dao.dart';
import 'package:getx_starter/view/home/model/user.dart';
import 'package:http/http.dart' as http;

import 'base/home_service_base.dart';

class HomeService with HomeServiceBase {
  // final http.Client httpClient;
  late Response response;
  final _dio = Dio(BaseOptions(
      baseUrl: AppConstants.API_URL,
      headers: {"Content-Type": "application/x-www-form-urlencoded"}));

  @override
  Future<User> getUser() async {
    User user = User();
    try {
      var response =
          await _dio.get("https://api.nationalize.io/?name=nathaniel");

      if (response.statusCode == 200) {
        user = userFromJson(json.encode(response.data));
        print(user);
        return user;
      } else {
        return user;
      }
    } on DioError catch (e) {
      print(e.message);
      return user;
    }
  }

  @override
  Future<LibraryDao> getLibraries() async {
    LibraryDao _libraryDao = new LibraryDao();

    try {
      response = await _dio.get("/api/libraries");

      var decodedJson = json.decode(json.encode(response.data));
      var result = LibraryDao.fromJson(decodedJson);
      return result;
    } on DioError catch (ex) {
      debugPrint("Error login " + ex.message);
      return _libraryDao;
    }
  }

  @override
  Future<LogDao> getLogs(int userId) async {
    LogDao _logDao = new LogDao();

    try {
      response = await _dio.get("/api/logs", queryParameters: {"id": userId});

      var decodedJson = json.decode(json.encode(response.data));
      var result = LogDao.fromJson(decodedJson);
      return result;
    } on DioError catch (ex) {
      debugPrint("Error login " + ex.message);
      return _logDao;
    }
  }

  @override
  Future<BookDao> getBooks() async {
    BookDao _bookDao = new BookDao();

    try {
      response = await _dio.get("/api/books");

      var decodedJson = json.decode(json.encode(response.data));
      var result = BookDao.fromJson(decodedJson);
      return result;
    } on DioError catch (ex) {
      debugPrint("Error login " + ex.message);
      return _bookDao;
    }
  }
}
