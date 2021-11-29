// ignore_for_file: prefer_const_constructors

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class CustomScaffold extends StatefulWidget {
  Widget body;
  int type;
  CustomScaffold({Key? key, required this.type, required this.body})
      : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.bottomBarBackground,
          onPressed: () {},
          child: Icon(Icons.settings),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: context.bottomBarBackground,
          splashColor: Colors.white,
          icons: const [Icons.home, Icons.search, Icons.mail, Icons.person],
          activeIndex: _homeController.tabIndex,
          inactiveColor: Colors.white,
          activeColor: Colors.white,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) {
            setState(() {
              _homeController.tabIndex = index;
              Get.toNamed(Routes.HOME);
            });
          },
        ),
        body: widget.body);
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.darkblue,
          size: 30,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.grey[200],
      automaticallyImplyLeading: false,
      title: Text(
        "METALIB",
        style: TextStyle(color: Colors.black),
      ),
      /*Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset("assets/images/logo2.png",
            width: context.getWidth * 0.5, height: context.getHeight * 0.05),
      ),*/
      actions: [
        InkWell(
            /*onTap: () {
              if (widget.type == 1) {
                Get.toNamed(Routes.MENU);
              } else {
                Get.back();
              }
            },*/
            child: Icon(
          Icons.format_align_right,
          color: Colors.blue[900],
          size: 40,
        ))
      ],
    );
  }
}
