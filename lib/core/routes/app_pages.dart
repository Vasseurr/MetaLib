import 'package:get/get.dart';
import 'package:getx_starter/core/pages/login_page_temp.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/auth/bindings/auth_binding.dart';
import 'package:getx_starter/view/auth/ui/login_page.dart';
import 'package:getx_starter/view/auth/ui/register_page.dart';
import 'package:getx_starter/view/home/bindings/home_binding.dart';
import 'package:getx_starter/view/home/ui/home_page.dart';
import 'package:getx_starter/view/home/ui/second_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterPage(),
        binding: AuthBinding())
    /*GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.SECOND,
        page: () => const SecondPage(),
        binding: HomeBinding()),*/
  ];
}
