import 'package:getx_starter/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();
}
