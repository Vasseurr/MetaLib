// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  HomeController _ = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      initState: (state) async {
        await _.getLibraries(context);
        await _.getBooks(context);
        if (_.checkUserSession() == true) {
          await _.getLogs(context);
        }
      },
      builder: (_) {
        return _.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(top: context.getHeight * 0.05),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return libraryBox(_, context, index);
                  },
                  padding: EdgeInsets.only(
                    top: context.getHeight * 0.01,
                    left: context.getWidth * 0.02,
                    right: context.getWidth * 0.02,
                  ),
                  itemCount: _.libraries.length,
                ),
              );
      },
    );
  }

  Widget libraryBox(HomeController _, BuildContext context, int index) {
    //String i2 = "https://istanbul.ktb.gov.tr/Resim/366718,2jpg.png?0";
    double percent =
        _.libraries[index].currentCapacity / _.libraries[index].totalCapacity;
    return Container(
      margin: EdgeInsets.only(
          bottom: context.getHeight * 0.02,
          left: context.getWidth * 0.01,
          right: context.getWidth * 0.01),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: _.libraries[index].imgPath,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    /* colorFilter:
                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)*/
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [Colors.yellow.shade900, context.specialRed]),
                ),
              );
            },
/*placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),*/
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
          Container(
            color: Colors.black45,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _.libraries[index].name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 1200,
                radius: 90.0,
                lineWidth: 13.0,
                percent: percent,
                //  header: new Text("Doluluk oranı",
                //      style: TextStyle(
                //          color: Colors.white, fontWeight: FontWeight.bold)),
                center: Text(
                  (100 * percent).toStringAsFixed(0) + ' %',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white,
                progressColor: context.specialGreen,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(_.libraries[index].totalCapacity.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text("Toplam Kapasite",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(_.libraries[index].currentCapacity.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text("Anlık Kapasite",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
