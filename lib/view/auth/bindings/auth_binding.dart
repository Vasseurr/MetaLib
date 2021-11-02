import 'package:get/instance_manager.dart';
import 'package:getx_starter/view/auth/controller/auth_controller.dart';
import 'package:getx_starter/view/auth/repository/auth_repository.dart';
import 'package:getx_starter/view/auth/service/auth_service.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      return AuthController(AuthRepository(AuthService()));
    });
  }
}
