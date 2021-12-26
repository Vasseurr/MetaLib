import 'package:getx_starter/view/home/model/DAO/book_dao.dart';
import 'package:getx_starter/view/home/model/DAO/library_dao.dart';
import 'package:getx_starter/view/home/model/DAO/log_dao.dart';
import 'package:getx_starter/view/home/model/DAO/response_dao.dart';
import 'package:getx_starter/view/home/model/DTO/attend_library_dto.dart';
import 'package:getx_starter/view/home/model/user.dart';

abstract class HomeServiceBase {
  Future<User> getUser();

  Future<LibraryDao> getLibraries();

  Future<LogDao> getLogs(int userId);

  Future<BookDao> getBooks();

  Future<ResponseDao> attendLibrary(AttendLibraryDto attendLibraryDto);
}
