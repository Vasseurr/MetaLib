import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_starter/view/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : assert(_authRepository != null);
}
