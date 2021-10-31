import 'package:get/get.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final RxString _userName = "".obs;
  HomeController(this._repository) : assert(_repository != null);

  get userName => _userName.value;

  set userName(value) => _userName.value = value;

  getUser() async {
    var result = await _repository.getUser();
    _userName.value = result.name!;
  }

  changeValue() {
    userName = "Template";
  }

  saveUser() async {
    HiveManager.setStringValue('user', userName);
  }

  getFromHiveManager() {
    return HiveManager.getStringValue('user');
  }
}
