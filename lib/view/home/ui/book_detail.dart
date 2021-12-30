import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:getx_starter/view/home/ui/home.dart';

class BookDetail extends GetView<HomeController> {
  int index = int.parse(HiveManager.getStringValue(HiveKeys.BOOKID)!);
  @override
  Widget build(BuildContext context) {
    HomeController _ = Get.find<HomeController>();
    return CustomScaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: bookDetails(_, context)));
  }

  Column bookDetails(HomeController _, BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            image(context, _.books[index].imagePath),
            bookInfos(_, context)
          ],
        ),
        bookDetail(_, context),
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
          //height: context.getHeight * 0.8,
        ),
      ),
    );
  }

  Padding bookInfos(HomeController _, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.getHeight * 0.1,
          right: context.getWidth * 0.01,
          left: context.getWidth * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            _.books[index].name,
            overflow: TextOverflow.clip,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            minFontSize: 14,
            maxFontSize: 20,
          ),
          SizedBox(height: context.getHeight * 0.03),
          AutoSizeText("Yazar: " + _.books[index].author,
              maxFontSize: 12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white)),
          SizedBox(height: context.getHeight * 0.03),
          Text("Tür: " + _.books[index].type,
              style: const TextStyle(color: Colors.white)),
          SizedBox(height: context.getHeight * 0.03),
          Text("Sayfa Sayısı: " + _.books[index].totalPage.toString(),
              style: const TextStyle(color: Colors.white)),
          SizedBox(height: context.getHeight * 0.03),
        ],
      ),
    );
  }

  bookDetail(HomeController _, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.getHeight * 0.03),
      child: AutoSizeText(_.books[index].description,
          maxFontSize: 18,
          minFontSize: 14,
          maxLines: 9,
          style: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
