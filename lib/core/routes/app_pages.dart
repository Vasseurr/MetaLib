import 'package:get/get.dart';
import 'package:getx_starter/core/pages/login_page.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/home/bindings/home_binding.dart';
import 'package:getx_starter/home/ui/home_page.dart';
import 'package:getx_starter/home/ui/second_page.dart';

class AppPages {
  static final pages = [
    GetPage(
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
        binding: HomeBinding()),
  ];
}
