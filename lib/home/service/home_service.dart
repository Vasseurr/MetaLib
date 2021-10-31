import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_starter/home/model/user.dart';
import 'package:getx_starter/home/service/base/home_service_base.dart';
import 'package:http/http.dart' as http;

class HomeService with HomeServiceBase {
  // final http.Client httpClient;
  final Dio _dio;

  HomeService(this._dio);

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
}
