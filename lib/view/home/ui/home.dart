// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:getx_starter/view/home/ui/home_page.dart';
import 'package:getx_starter/view/home/ui/log.dart';
import 'package:getx_starter/view/home/ui/profile.dart';

import 'book.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex,
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
