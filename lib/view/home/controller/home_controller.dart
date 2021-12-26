import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/view/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;
  final RxString _userName = "".obs;
  HomeController(this._homeRepository) : assert(_homeRepository != null);

  final _tabIndex = 0.obs;
  final _isOpened = false.obs;
  final _bookId = 0.obs;
  var _isLoading = false.obs;

  set userName(value) => _userName.value = value;
  get userName => _userName.value;

  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;

  set isOpened(value) => _isOpened.value = value;
  get isOpened => _isOpened.value;

  set bookId(value) => _bookId.value = value;
  get bookId => _bookId.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  get isLoading => _isLoading.value;

  checkUserSession() {
    var user = HiveManager.getStringValue(HiveKeys.USERID);

    if (user != null) return true;

    return false;
  }

  getLibraries(BuildContext context) async {
    _isLoading.value = true;

    var response = await _homeRepository.getLibraries();

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (!response.status!) {
      _isLoading.value = false;
      Utils.instance.showSnackBar(context, content: response.textFromApi!);
    }
  }
}
