import 'package:getx_starter/view/auth/model/DAO/login_dao.dart';
import 'package:getx_starter/view/auth/model/DAO/register_dao.dart';
import 'package:getx_starter/view/auth/model/DTO/login_dto.dart';
import 'package:getx_starter/view/auth/model/DTO/register_dto.dart';

abstract class AuthServiceBase {
  Future<RegisterDao> register(RegisterDto registerDto);

  Future<LoginDao> login(LoginDto loginDto);
}
