// ignore_for_file: prefer_final_fields, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/model/DAO/edit_profile.dart';
import 'package:getx_starter/view/home/model/DAO/log_dao.dart';
import 'package:getx_starter/view/home/model/DAO/search_dao.dart';
import 'package:getx_starter/view/home/model/DTO/attend_library_dto.dart';
import 'package:getx_starter/view/home/model/DTO/book_dto.dart';
import 'package:getx_starter/view/home/model/DTO/leave_library_dto.dart';
import 'package:getx_starter/view/home/model/DTO/library_dto.dart';
import 'package:getx_starter/view/home/model/DTO/log_dto.dart';
import 'package:getx_starter/view/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;
  final RxString _userName = "".obs;
  HomeController(this._homeRepository) : assert(_homeRepository != null);

  final _tabIndex = 0.obs;
  final _isOpened = false.obs;
  final _bookId = 0.obs;
  var _isLoading = false.obs;
  var _libraries = <Library>[].obs;
  var _logs = LogDao().obs;
  var _books = <Book>[].obs;
  var _searchResults = new SearchDao().obs;
  var _isResultEmpty = false.obs;
  var _isAttended = false.obs;

  set userName(value) => _userName.value = value;
  get userName => _userName.value;

  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;

  set isOpened(value) => _isOpened.value = value;
  get isOpened => _isOpened.value;

  set bookId(value) => _bookId.value = value;
  get bookId => _bookId.value;

  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  set libraries(value) => _libraries.value = value;
  get libraries => _libraries.value;

  set logs(value) => _logs.value = value;
  get logs => _logs.value;

  set books(value) => _books.value = value;
  get books => _books.value;

  set searchResults(value) => _searchResults.value = value;
  get searchResults => _searchResults.value;

  set isResultEmpty(value) => _isResultEmpty.value = value;
  get isResultEmpty => _isResultEmpty.value;

  set isAttended(value) => _isAttended.value = value;
  get isAttended => _isAttended.value;

  checkUserSession() {
    var user = HiveManager.getStringValue(HiveKeys.USERID);
    var isLogined = HiveManager.getStringValue(HiveKeys.ISLOGINED);
    // ignore: unrelated_type_equality_checks
    if (user != null && isLogined == "true") return true;

    return false;
  }

  getLibraries(BuildContext context) async {
    _isLoading.value = true;

    var response = await _homeRepository.getLibraries();

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (!response.status!) {
      _isLoading.value = false;
      Utils.instance.showSnackBar(context, content: response.textFromApi!);
    } else {
      libraries = response.libraries;
      _isLoading.value = false;
    }
  }

  getLogs(BuildContext context) async {
    _isLoading.value = true;

    if (checkUserSession()) {
      var userId = HiveManager.getStringValue(HiveKeys.USERID);
      var response = await _homeRepository.getLogs(int.parse(userId!));

      // Utils.instance.showSnackBar(context, content: response.textFromApi!);
      if (!response.status!) {
        Utils.instance.showSnackBar(context, content: response.textFromApi!);
      } else {
        logs = response;
      }
    }
    _isLoading.value = false;
  }

  getBooks(BuildContext context) async {
    _isLoading.value = true;

    var response = await _homeRepository.getBooks();

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (!response.status!) {
      _isLoading.value = false;
      Utils.instance.showSnackBar(context, content: response.textFromApi!);
    } else {
      books = response.books;
      _isLoading.value = false;
    }
  }

  attendLibrary(BuildContext context) async {
    _isLoading.value = true;

    AttendLibraryDto attendLibraryDto = new AttendLibraryDto();
    attendLibraryDto.libId =
        int.parse(HiveManager.getStringValue(HiveKeys.LIBRARYID)!);
    attendLibraryDto.userId =
        int.parse(HiveManager.getStringValue(HiveKeys.USERID)!);

    var response = await _homeRepository.attendLibrary(attendLibraryDto);

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (!response.status!) {
      _isLoading.value = false;
    } else {
      _isAttended.value = true;
      HiveManager.setStringValue(HiveKeys.LOGID, response.logId.toString());
      Get.toNamed(Routes.HOME);
    }
  }

  leaveLibrary(BuildContext context) async {
    _isLoading.value = true;

    LeaveLibraryDto leaveLibraryDto = new LeaveLibraryDto();
    leaveLibraryDto.libId =
        int.parse(HiveManager.getStringValue(HiveKeys.LIBRARYID)!);
    leaveLibraryDto.userId =
        int.parse(HiveManager.getStringValue(HiveKeys.USERID)!);
    leaveLibraryDto.logId =
        int.parse(HiveManager.getStringValue(HiveKeys.LOGID)!);

    var response = await _homeRepository.leaveLibrary(leaveLibraryDto);

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (!response.status!) {
      _isLoading.value = false;
    } else {
      _isAttended.value = false;
      Get.toNamed(Routes.HOME);
    }
  }

  searchBooks(String text) async {
    _isLoading.value = true;

    var response = await _homeRepository.searchBooks(text);

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (response.status!) {
      _books.value = response.books!.cast<Book>();
      _isResultEmpty.value = false;
      _isLoading.value = false;
    } else {
      _isResultEmpty.value = true;
      _isLoading.value = false;
    }
  }

  editProfile(EditProfileDto editProfileDto, BuildContext context) async {
    _isLoading.value = true;

    editProfileDto.userId =
        int.parse(HiveManager.getStringValue(HiveKeys.USERID)!);

    editProfileDto.userName!.isEmpty
        ? editProfileDto.userName =
            HiveManager.getStringValue(HiveKeys.USERNAME)
        : editProfileDto.userName;
    editProfileDto.firstName!.isEmpty
        ? HiveManager.getStringValue(HiveKeys.FIRSTNAME)
        : editProfileDto.firstName;
    editProfileDto.surname!.isEmpty
        ? editProfileDto.surname = HiveManager.getStringValue(HiveKeys.SURNAME)
        : editProfileDto.surname;
    editProfileDto.email!.isEmpty
        ? editProfileDto.email = HiveManager.getStringValue(HiveKeys.EMAIL)
        : editProfileDto.email;
    editProfileDto.phoneNumber!.isEmpty
        ? editProfileDto.phoneNumber =
            HiveManager.getStringValue(HiveKeys.PHONE)
        : editProfileDto.phoneNumber;
    editProfileDto.address!.isEmpty
        ? editProfileDto.address = HiveManager.getStringValue(HiveKeys.ADDRESS)
        : editProfileDto.address;

    HiveManager.setStringValue(HiveKeys.USERNAME, editProfileDto.userName!);
    HiveManager.setStringValue(HiveKeys.FIRSTNAME, editProfileDto.firstName!);
    HiveManager.setStringValue(HiveKeys.SURNAME, editProfileDto.surname!);
    HiveManager.setStringValue(HiveKeys.EMAIL, editProfileDto.email!);
    HiveManager.setStringValue(HiveKeys.PHONE, editProfileDto.phoneNumber!);
    HiveManager.setStringValue(HiveKeys.ADDRESS, editProfileDto.address!);

    var response = await _homeRepository.editProfile(editProfileDto);

    // Utils.instance.showSnackBar(context, content: response.textFromApi!);
    Utils.instance.showSnackBar(context, content: response.textFromApi!);
    if (response.status!) {
      _isLoading.value = false;
      Get.toNamed(Routes.HOME);
    } else {
      _isLoading.value = false;
    }
  }
}
