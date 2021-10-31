import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_pages.dart';
import 'package:getx_starter/core/routes/app_routes.dart';

void main() async {
  await HiveManager.preferencesInit();
  //await Hive.initFlutter();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    //theme: AppThemeLight.instance.theme,
    getPages: AppPages.pages,
  ));
}
