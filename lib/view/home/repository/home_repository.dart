import 'package:getx_starter/view/home/model/DAO/book_dao.dart';
import 'package:getx_starter/view/home/model/DAO/edit_profile.dart';
import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/DAO/log_dao.dart';
import 'package:getx_starter/view/home/model/DAO/search_dao.dart';
import 'package:getx_starter/view/home/model/DTO/attend_library_dto.dart';
import 'package:getx_starter/view/home/model/DAO/response_dao.dart';
import 'package:getx_starter/view/home/model/DTO/leave_library_dto.dart';
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
    return await _homeService.getLibraries();
  }

  @override
  Future<LogDao> getLogs(int userId) async {
    return await _homeService.getLogs(userId);
  }

  @override
  Future<BookDao> getBooks() async {
    return await _homeService.getBooks();
  }

  @override
  Future<ResponseDao> attendLibrary(AttendLibraryDto attendLibraryDto) async {
    return await _homeService.attendLibrary(attendLibraryDto);
  }

  @override
  Future<ResponseDao> leaveLibrary(LeaveLibraryDto leaveLibraryDto) async {
    return await _homeService.leaveLibrary(leaveLibraryDto);
  }

  @override
  Future<SearchDao> searchBooks(String text) async {
    return await _homeService.searchBooks(text);
  }

  @override
  Future<ResponseDao> editProfile(EditProfileDto editProfileDto) async {
    return await _homeService.editProfile(editProfileDto);
  }
}
