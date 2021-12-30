// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

//class ProfilePage extends GetView<HomeController> {
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imageLink =
        "https://www.seekpng.com/png/detail/1010-10108361_person-icon-circle.png";
    return
        //GetX<HomeController>(
        //    initState: (state) {},
        //    builder: (_) {
        // return
        Container(
            margin: context.marginWidthLow,
            child: Get.find<HomeController>().checkUserSession() == true
                //child: _.checkUserSession() == true
                ? infos(context)
                : authButtons(context));

    //   });
  }

  Column infos(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /*SizedBox(
          height: context.getHeight * 0.1,
          width: context.getWidth * 0.25,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageLink),
          ),
        ),*/
        Spacer(),
        textField("Kullanıcı Adı",
            HiveManager.getStringValue(HiveKeys.USERNAME) ?? "temp", context),
        textField("İsim",
            HiveManager.getStringValue(HiveKeys.FIRSTNAME) ?? "temp", context),
        textField("Soyisim",
            HiveManager.getStringValue(HiveKeys.SURNAME) ?? "temp", context),
        textField("E-posta",
            HiveManager.getStringValue(HiveKeys.EMAIL) ?? "temp", context),
        textField("Telefon Numarası",
            HiveManager.getStringValue(HiveKeys.PHONE) ?? "temp", context),
        textField("Adres",
            HiveManager.getStringValue(HiveKeys.ADDRESS) ?? "temp", context),
        Spacer(),
        Container(
            margin: EdgeInsets.only(
                left: context.getWidth * 0.15, right: context.getWidth * 0.15),
            child: VasseurrBttn(
                buttonText: "Çıkış Yap",
                buttonColor: context.specialBlack,
                borderColor: context.specialBlack,
                onPressed: () {
                  Get.find<HomeController>().isLogined = false;
                  Utils.instance.showSnackBar(context,
                      content: "Başarıyla çıkış yapıldı");
                  Get.find<HomeController>().tabIndex = 0;
                })),
      ],
    );
  }

  Padding authButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.getWidth * 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VasseurrBttn(
              width: context.getWidth * 0.4,
              buttonText: "Giriş Yap",
              buttonColor: context.specialBlack,
              borderColor: context.specialBlack,
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              }),
          VasseurrBttn(
              width: context.getWidth * 0.4,
              buttonText: "Kayıt Ol",
              buttonColor: context.specialBlack,
              borderColor: context.specialBlack,
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              })
        ],
      ),
    );
  }

  Container textField(String fieldName, String value, BuildContext context) {
    return Container(
      height: context.getHeight * 0.08,
      margin: context.marginWidthLow,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 2))),
      child: Container(
        margin: EdgeInsets.only(
            left: context.getWidth * 0.05, right: context.getWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: context.getWidth * 0.3,
                child: Text(fieldName, style: TextStyle(color: Colors.white))),
            SizedBox(width: context.getWidth * 0.15),
            SizedBox(
                width: context.getWidth * 0.4,
                child: Text(value, style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
