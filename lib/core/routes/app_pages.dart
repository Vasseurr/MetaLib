import 'package:get/get.dart';
import 'package:getx_starter/core/pages/login_page_temp.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/auth/bindings/auth_binding.dart';
import 'package:getx_starter/view/auth/ui/login_page.dart';
import 'package:getx_starter/view/auth/ui/register_page.dart';
import 'package:getx_starter/view/home/bindings/home_binding.dart';
import 'package:getx_starter/view/home/ui/book.dart';
import 'package:getx_starter/view/home/ui/home.dart';
import 'package:getx_starter/view/home/ui/log.dart';
import 'package:getx_starter/view/home/ui/profile.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.HOME, page: () => const Home(), binding: HomeBinding()),
    GetPage(
        name: Routes.BOOK, page: () => const Book(), binding: HomeBinding()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: HomeBinding()),
    GetPage(name: Routes.LOG, page: () => const Log(), binding: HomeBinding()),
  ];
}
