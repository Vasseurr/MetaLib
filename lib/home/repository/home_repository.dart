import 'package:getx_starter/home/model/user.dart';
import 'package:getx_starter/home/service/base/home_service_base.dart';
import 'package:getx_starter/home/service/home_service.dart';

class HomeRepository with HomeServiceBase {
  final HomeService _homeService;

  HomeRepository(this._homeService) : assert(_homeService != null);

  @override
  Future<User> getUser() async {
    return _homeService.getUser();
  }
}
