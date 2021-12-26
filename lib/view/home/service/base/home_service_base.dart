import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();

  Future<LibraryDao> getLibraries();
}
