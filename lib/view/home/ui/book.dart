// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class Books extends GetView<HomeController> {
  Books({Key? key}) : super(key: key);

  String searchText = "";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      initState: (state) {},
      builder: (_) {
        return //_.isLoading == true
            // ? Center(child: CircularProgressIndicator())
            //:
            Column(
          children: [
            search(context),
            _.isLoading == false
                ? Flexible(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return book(_, context, index);
                      },
                      padding: EdgeInsets.only(
                        top: context.getHeight * 0.02,
                        left: context.getWidth * 0.02,
                        right: context.getWidth * 0.02,
                      ),
                      itemCount: _.books.length,
                    ),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        );
      },
    );
  }

  search(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.getHeight * 0.08,
      width: context.getWidth,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: VasseurrTFF(
                        borderColor: Colors.white,
                        fillColor: Colors.white,
                        hintColor: context.specialBrown,
                        hintText: "Kitap Ara",
                        onSaved: (value) => searchText = value!,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Get.find<HomeController>().searchBooks(searchText);
                      }
                    },
                    child: Icon(Icons.search, color: context.specialBrown),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget book(HomeController _, BuildContext context, int index) {
    /*String path =
        "https://upload.wikimedia.org/wikipedia/tr/thumb/3/3a/Sineklerintanrisi.jpg/220px-Sineklerintanrisi.jpg";*/
    return Container(
      margin: EdgeInsets.only(bottom: context.getHeight * 0.02),
      padding: EdgeInsets.only(bottom: context.getHeight * 0.02),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: InkWell(
        onTap: () {
          HiveManager.setStringValue(HiveKeys.BOOKID, index.toString());
          print(HiveManager.getStringValue(HiveKeys.BOOKID));
          //  Get.find<HomeController>().bookId = index;
          Get.toNamed(Routes.BOOK_DETAIL);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: context.specialGreen, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  _.books[index].imagePath,
                  height: context.getHeight * 0.2,
                ),
              ),
            )),
            SizedBox(
              width: context.getWidth * 0.1,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(_.books[index].name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19)),
                SizedBox(height: context.getHeight * 0.03),
                Text(_.books[index].author,
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: context.getHeight * 0.03),
                Text(
                  _.books[index].belongLibName,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
