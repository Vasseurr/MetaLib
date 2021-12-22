import 'package:get/get.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/view/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final RxString _userName = "".obs;
  HomeController(this._repository) : assert(_repository != null);

  final _tabIndex = 0.obs;
  final _isOpened = false.obs;

  set userName(value) => _userName.value = value;
  get userName => _userName.value;

  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;

  set isOpened(value) => _isOpened.value;
  get isOpened => _isOpened.value;

  checkUserSession() {
    var user = HiveManager.getStringValue(HiveKeys.USERID);

    if (user != " ") return true;

    return false;
  }
}
