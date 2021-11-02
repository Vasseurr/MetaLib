import 'package:getx_starter/view/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();
}
