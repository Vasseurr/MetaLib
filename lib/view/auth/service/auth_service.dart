// ignore_for_file: unnecessary_new, prefer_function_declarations_over_variables

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_starter/core/constants/app_constants.dart';
import 'package:getx_starter/view/auth/model/DTO/register_dto.dart';
import 'package:getx_starter/view/auth/model/DTO/login_dto.dart';
import 'package:getx_starter/view/auth/model/DAO/register_dao.dart';
import 'package:getx_starter/view/auth/model/DAO/login_dao.dart';
import 'package:getx_starter/view/auth/service/base/auth_service_base.dart';

class AuthService with AuthServiceBase {
  //Map<String, String> _headers = {"Content-Type": "application/x-www-form-urlencoded"};

  late Response response;
  final _dio = Dio(BaseOptions(
      baseUrl: AppConstants.API_URL,
      headers: {"Content-Type": "application/x-www-form-urlencoded"}));

  @override
  Future<LoginDao> login(LoginDto loginDto) async {
    LoginDao _loginDao = new LoginDao();

    try {
      response = await _dio.post("/api/login", data: loginDto.toJson());

      var decodedJson = json.decode(json.encode(response.data));
      var result = LoginDao.fromJson(decodedJson);
      return result;
    } on DioError catch (ex) {
      debugPrint("Error login " + ex.message);
      return _loginDao;
    }
  }

  @override
  Future<RegisterDao> register(RegisterDto registerDto) async {
    RegisterDao _registerDao = new RegisterDao();

    try {
      response = await _dio.post("/api/register", data: registerDto.toJson());

      var decodedJson = json.decode(json.encode(response.data));
      var result = RegisterDao.fromJson(decodedJson);
      return result;
    } on DioError catch (ex) {
      debugPrint("Error register " + ex.message);
      return _registerDao;
    }
  }
}
