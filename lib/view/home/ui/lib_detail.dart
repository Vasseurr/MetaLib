import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class LibDetail extends GetView<HomeController> {
  int index = int.parse(HiveManager.getStringValue(HiveKeys.LIBRARYID)!) - 1;
  @override
  Widget build(BuildContext context) {
    HomeController _ = Get.find<HomeController>();
    return CustomScaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: bookDetails(_, context))));
  }

  Column bookDetails(HomeController _, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        image(context, _.libraries[index].imgPath),
        bookInfos(_, context),
        libDetail(_, context),
        SizedBox(height: context.getHeight * 0.03),
        _.logs.activeLib == null
            ? VasseurrBttn(
                buttonText: _.checkUserSession() == true
                    ? "Kütüphaneye katıl"
                    : "Lütfen Giriş Yapın",
                fontSize: 20,
                buttonColor: Colors.grey,
                textColor: Colors.white,
                borderColor: Colors.grey,
                height: context.getHeight * 0.07,
                width: context.getWidth,
                radius: 20,
                onPressed: () {
                  if (_.checkUserSession()) {
                    _.attendLibrary(context);
                  } else {
                    Get.toNamed(Routes.LOGIN);
                  }
                })
            : _.logs.activeLib == _.libraries[index].name
                ? VasseurrBttn(
                    buttonText: _.checkUserSession() == true
                        ? "Kütüphaneden çıkış yap"
                        : "Lütfen Giriş Yapın",
                    fontSize: 20,
                    buttonColor: Colors.grey,
                    textColor: Colors.white,
                    borderColor: Colors.grey,
                    height: context.getHeight * 0.07,
                    width: context.getWidth,
                    radius: 20,
                    onPressed: () {
                      if (_.checkUserSession()) {
                        _.leaveLibrary(context);
                      } else {
                        Get.toNamed(Routes.LOGIN);
                      }
                    })
                : const SizedBox(),
      ],
    );
  }

  Container image(BuildContext context, String path) {
    return Container(
      height: context.getHeight * 0.3,
      margin: EdgeInsets.only(top: context.getHeight * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.specialBlack, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          path,
          fit: BoxFit.cover,
          //height: context.getHeight * 0.8,
        ),
      ),
    );
  }

  Padding bookInfos(HomeController _, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.getHeight * 0.05,
          right: context.getWidth * 0.01,
          left: context.getWidth * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _.libraries[index].name,
            overflow: TextOverflow.clip,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            maxLines: 2,
          ),
          SizedBox(height: context.getHeight * 0.03),
          Text(
              "Anlık Kapasite: " +
                  _.libraries[index].currentCapacity.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: context.getHeight * 0.03),
          Text("Total Kapasite: " + _.libraries[index].totalCapacity.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: context.getHeight * 0.03),
          Text("Telefon Numarası: " + _.libraries[index].phoneNumber,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: context.getHeight * 0.03),
        ],
      ),
    );
  }

  libDetail(HomeController _, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: context.getWidth * 0.01, left: context.getWidth * 0.01),
      child: Text(_.libraries[index].address,
          maxLines: 9,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
