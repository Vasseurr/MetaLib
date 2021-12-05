// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class SpecialFABButton extends StatefulWidget {
  int type;

  SpecialFABButton({Key? key, required this.type}) : super(key: key);

  @override
  _SpecialFABButtonState createState() => _SpecialFABButtonState();
}

class _SpecialFABButtonState extends State<SpecialFABButton>
    with SingleTickerProviderStateMixin {
  HomeController _homeController = Get.find<HomeController>();
  //bool isOpened = false;
  late AnimationController _animationController;
  Icon mainFabIcon = Icon(Icons.add);
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          });
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.translationValues(
              0.0, -_translateButton.value * 3.6, 0.0),
          child: notificationButton(),
        ),
        Transform(
            transform: Matrix4.translationValues(
                0.0, -_translateButton.value * 2.4, 0.0),
            child: mailButton()),
        Transform(
            transform: Matrix4.translationValues(
                0.0, -_translateButton.value * 1.2, 0.0),
            child: personButton()),
        mainFAB(context),
      ],
    );
  }

  FloatingActionButton notificationButton() => FloatingActionButton(
      heroTag: "Notifications",
      onPressed: null,
      backgroundColor: context.specialRed,
      child: Icon(Icons.notification_add, size: 40));
  FloatingActionButton mailButton() => FloatingActionButton(
        heroTag: "Mail",
        onPressed: null,
        backgroundColor: context.specialRed,
        child: Icon(Icons.mail, size: 40),
      );

  FloatingActionButton personButton() => FloatingActionButton(
        heroTag: "Person",
        onPressed: null,
        backgroundColor: context.specialRed,
        child: Icon(Icons.person, size: 40),
      );

  mainFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: animate,
      backgroundColor: _homeController.isOpened == true
          ? context.specialRed
          : context.specialYellow,
      child: _homeController.isOpened == true ? mainFabIcon : Icon(Icons.close),
    );
  }

  void animate() {
    if (!_homeController.isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    _homeController.isOpened = !_homeController.isOpened;
  }
}
