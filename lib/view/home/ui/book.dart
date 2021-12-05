// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/routes/app_routes.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        search(),
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return book();
            },
            padding: EdgeInsets.only(
              top: context.getHeight * 0.02,
              left: context.getWidth * 0.02,
              right: context.getWidth * 0.02,
            ),
            itemCount: 6,
          ),
        ),
      ],
    );
  }

  search() {
    return Container(
      height: context.getHeight * 0.08,
      width: context.getWidth,
      /* padding: EdgeInsets.only(
          top: context.getHeight * 0.01,
          bottom: context.getHeight * 0.01,
          right: context.getWidth * 0.03,
          left: context.getWidth * 0.03),*/
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: context.specialBrown, width: 2))),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: VasseurrTFF(
                        borderColor: Colors.white,
                        fillColor: Colors.white,
                        hintColor: context.specialBrown,
                        hintText: "Kitap Ara",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.search, color: context.specialBrown),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bookCard() {
    String path =
        "https://upload.wikimedia.org/wikipedia/tr/thumb/3/3a/Sineklerintanrisi.jpg/220px-Sineklerintanrisi.jpg";
    return Container(
      margin: context.marginWidthLow,
      decoration: BoxDecoration(
          border: Border.all(color: context.specialYellow, width: 2)),
      child: Column(
        children: [
          Flexible(child: Image.network(path)),
          Flexible(child: Text("Sineklerin Tanrısı")),
        ],
      ),
    );
  }

  Widget book() {
    String path =
        "https://upload.wikimedia.org/wikipedia/tr/thumb/3/3a/Sineklerintanrisi.jpg/220px-Sineklerintanrisi.jpg";
    return Container(
      margin: EdgeInsets.only(bottom: context.getHeight * 0.02),
      padding: EdgeInsets.only(bottom: context.getHeight * 0.02),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
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
                path,
                height: context.getHeight * 0.2,
              ),
            ),
          )),
          SizedBox(
            width: context.getWidth * 0.1,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("Sineklerin Tanrısı",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: context.getHeight * 0.03),
              Text("William Golding"),
              SizedBox(height: context.getHeight * 0.03),
              Text("Roman"),
            ],
          )),
        ],
      ),
    );
  }
}
