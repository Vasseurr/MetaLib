// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:getx_starter/view/home/ui/home_page.dart';
import 'package:getx_starter/view/home/ui/log.dart';
import 'package:getx_starter/view/home/ui/profile.dart';

import 'book.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Obx(() => IndexedStack(
            index: _homeController.tabIndex,
            children: [
              //pages
              HomePage(),
              Book(),
              Log(),
              ProfilePage(),
            ],
          )),
    );
  }
}
