import 'package:getx_starter/view/home/model/DAO/book_dao.dart';
import 'package:getx_starter/view/home/model/DAO/edit_profile.dart';
import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/DAO/log_dao.dart';
import 'package:getx_starter/view/home/model/DAO/response_dao.dart';
import 'package:getx_starter/view/home/model/DAO/search_dao.dart';
import 'package:getx_starter/view/home/model/DTO/attend_library_dto.dart';
import 'package:getx_starter/view/home/model/DTO/leave_library_dto.dart';
import 'package:getx_starter/view/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();

  Future<LibraryDao> getLibraries();

  Future<LogDao> getLogs(int userId);

  Future<BookDao> getBooks();

  Future<ResponseDao> attendLibrary(AttendLibraryDto attendLibraryDto);

  Future<ResponseDao> leaveLibrary(LeaveLibraryDto leaveLibraryDto);

  Future<SearchDao> searchBooks(String text);

  Future<ResponseDao> editProfile(EditProfileDto editProfileDto);
}
