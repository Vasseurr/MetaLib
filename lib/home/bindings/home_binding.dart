import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_starter/home/controller/home_controller.dart';
import 'package:getx_starter/home/repository/home_repository.dart';
import 'package:getx_starter/home/service/home_service.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(HomeRepository(HomeService(Dio())));
    });
  }
}
