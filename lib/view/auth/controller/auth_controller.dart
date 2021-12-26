import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/auth/model/DTO/login_dto.dart';
import 'package:getx_starter/view/auth/model/DTO/register_dto.dart';
import 'package:getx_starter/view/auth/repository/auth_repository.dart';

class AuthController extends GetxController with StateMixin {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : assert(_authRepository != null);

  var _confirmPassword = "".obs;
  var _isLoading = false.obs;

  set confirmPassword(value) {
    _confirmPassword.value = value;
  }

  get confirmPassword => _confirmPassword.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  get isLoading => _isLoading.value;

  register(RegisterDto registerDto, BuildContext context) async {
    change(null, status: RxStatus.loading());

    var response = await _authRepository.register(registerDto);

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (response.status!) {
      change(null, status: RxStatus.success());

      Get.toNamed(Routes.LOGIN);
    } else {
      change(null, status: RxStatus.success());
      Utils.instance.showSnackBar(context, content: response.textFromApi!);
    }
  }

  login(LoginDto loginDTO, BuildContext context) async {
    //change(null, status: RxStatus.loading());
    isLoading = true;

    var response = await _authRepository.login(loginDTO);

    if (response.status!) {
      await HiveManager.setStringValue(HiveKeys.USERID, response.userId!);
      await HiveManager.setStringValue(HiveKeys.USERNAME, response.userName!);
      await HiveManager.setStringValue(HiveKeys.FIRSTNAME, response.firstName!);
      await HiveManager.setStringValue(HiveKeys.SURNAME, response.surname!);
      await HiveManager.setStringValue(HiveKeys.PHONE, response.phoneNumber!);
      await HiveManager.setStringValue(HiveKeys.EMAIL, response.email!);
      await HiveManager.setStringValue(HiveKeys.ADDRESS, response.address!);

      //Utils.instance.showSnackBar(context, content: response.textFromApi!);
      //change(null, status: RxStatus.success());
      isLoading = false;
      Get.offAndToNamed(Routes.HOME);
    }
    isLoading = false;
  }
}
