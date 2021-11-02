import 'package:getx_starter/view/auth/service/auth_service.dart';
import 'package:getx_starter/view/auth/service/base/auth_service_base.dart';

class AuthRepository with AuthServiceBase {
  final AuthService _authService;

  AuthRepository(this._authService) : assert(_authService != null);
}
