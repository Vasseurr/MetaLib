// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return libraryBox();
      },
      padding: EdgeInsets.only(
        top: context.getHeight * 0.01,
        left: context.getWidth * 0.02,
        right: context.getWidth * 0.02,
      ),
      itemCount: 6,
    );
  }

  Widget libraryBox() {
    String i2 = "https://istanbul.ktb.gov.tr/Resim/366718,2jpg.png?0";
    double percent = 0.7;
    return Container(
      margin: EdgeInsets.only(
          bottom: context.getHeight * 0.02,
          left: context.getWidth * 0.01,
          right: context.getWidth * 0.01),
      child: GridTile(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(i2), fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Fatih kütüphanesi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  animationDuration: 1200,
                  radius: 100.0,
                  lineWidth: 13.0,
                  percent: percent,
                  //  header: new Text("Doluluk oranı",
                  //      style: TextStyle(
                  //          color: Colors.white, fontWeight: FontWeight.bold)),
                  center: Text(
                    (100 * percent).toString() + ' %',
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
                        Text("10",
                            style: TextStyle(
                                color: context.specialYellow, fontSize: 14)),
                        Text("Toplam Kapasite",
                            style: TextStyle(
                                color: context.specialYellow, fontSize: 10)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("7",
                            style: TextStyle(
                                color: context.specialYellow, fontSize: 14)),
                        Text("Anlık Kapasite",
                            style: TextStyle(
                                color: context.specialYellow, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
