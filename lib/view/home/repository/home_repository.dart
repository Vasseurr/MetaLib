import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/user.dart';
import 'package:getx_starter/view/home/service/base/home_service_base.dart';
import 'package:getx_starter/view/home/service/home_service.dart';

class HomeRepository with HomeServiceBase {
  final HomeService _homeService;

  HomeRepository(this._homeService) : assert(_homeService != null);

  @override
  Future<User> getUser() async {
    return _homeService.getUser();
  }

  @override
  Future<LibraryDao> getLibraries() async {
    return _homeService.getLibraries();
  }
}
