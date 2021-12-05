// ignore_for_file: prefer_const_constructors

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class CustomScaffold extends StatefulWidget {
  Widget body;
  CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final HomeController _homeController = Get.find<HomeController>();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        //  backgroundColor: context.specialBrown,
        /* floatingActionButton: FloatingActionButton(
          backgroundColor: context.bottomBarBackground,
          onPressed: () {},
          child: Icon(Icons.settings),
        ),*/
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: context.specialRed,
          selectedIndex: _homeController.tabIndex,
          onItemSelected: (index) => setState(() {
            _homeController.tabIndex = index;
            /* switch (index) {
              case 0:
                Get.offAndToNamed(Routes.HOME);
                break;
              case 1:
                Get.toNamed(Routes.BOOK);
                break;
              case 2:
                Get.toNamed(Routes.LOG);
                break;
              case 3:
                Get.toNamed(Routes.PROFILE);
                break;
            }*/
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              activeColor: context.specialYellow,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.book),
              title: Text('Book', style: TextStyle(color: Colors.white)),
              activeColor: context.specialYellow,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.donut_large_outlined),
              title: Text('Log', style: TextStyle(color: Colors.white)),
              activeColor: context.specialYellow,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              activeColor: context.specialYellow,
            ),
          ],
        ),
        body: widget.body);
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      /*  leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.darkblue,
          size: 30,
        ),
        onPressed: () {
          Get.back();
        },
      ),*/
      backgroundColor: context.specialRed,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          "METALIB",
          style: TextStyle(color: Colors.white),
        ),
      ),
      /*Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset("assets/images/logo2.png",
            width: context.getWidth * 0.5, height: context.getHeight * 0.05),
      ),*/
      /*    actions: [
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
      ],*/
    );
  }
}
