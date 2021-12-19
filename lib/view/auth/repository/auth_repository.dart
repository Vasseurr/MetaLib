import 'package:getx_starter/view/auth/model/DTO/register_dto.dart';
import 'package:getx_starter/view/auth/model/DTO/login_dto.dart';
import 'package:getx_starter/view/auth/model/DAO/register_dao.dart';
import 'package:getx_starter/view/auth/model/DAO/login_dao.dart';
import 'package:getx_starter/view/auth/service/auth_service.dart';
import 'package:getx_starter/view/auth/service/base/auth_service_base.dart';

class AuthRepository with AuthServiceBase {
  final AuthService _authService;

  AuthRepository(this._authService) : assert(_authService != null);

  @override
  Future<LoginDao> login(LoginDto loginDto) async {
    return await _authService.login(loginDto);
  }

  @override
  Future<RegisterDao> register(RegisterDto registerDto) async {
    return await _authService.register(registerDto);
  }
}
