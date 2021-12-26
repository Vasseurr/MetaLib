import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_pages.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/bindings/home_binding.dart';

void main() async {
  await HiveManager.preferencesInit();
  //await HiveManager.setStringValue(HiveKeys.USERID, " ");
  //await Hive.initFlutter();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    //theme: AppThemeLight.instance.theme,
    getPages: AppPages.pages,
  ));
}
