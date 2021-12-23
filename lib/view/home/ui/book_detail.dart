import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class BookDetail extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String path =
        "https://upload.wikimedia.org/wikipedia/tr/thumb/3/3a/Sineklerintanrisi.jpg/220px-Sineklerintanrisi.jpg";
    return CustomScaffold(
        body: GetX<HomeController>(
      initState: (state) {},
      builder: (_) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _.bookId == 0
                ? bookDetails(context, path)
                : const Center(child: CircularProgressIndicator()));
      },
    ));
  }

  Column bookDetails(BuildContext context, String path) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [image(context, path), bookInfos(context)],
          ),
        ),
        bookDetail(),
      ],
    );
  }

  Container image(BuildContext context, String path) {
    return Container(
      width: context.getWidth * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.specialGreen, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          path,
          //height: context.getHeight * 0.8,
        ),
      ),
    );
  }

  Padding bookInfos(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.getHeight * 0.05, right: context.getWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sineklerin Tanrısı",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          SizedBox(height: context.getHeight * 0.03),
          const Text("Yazar: William Golding",
              style: TextStyle(color: Colors.white)),
          SizedBox(height: context.getHeight * 0.03),
          const Text("Tür: Roman", style: TextStyle(color: Colors.white)),
          SizedBox(height: context.getHeight * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bulunduğu Kütüphaneler",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: context.getHeight * 0.03),
              const Text("Fatih Kütüphanesi",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic)),
              SizedBox(height: context.getHeight * 0.03),
              const Text("Kadırga Kütüphanesi",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic)),
            ],
          )
        ],
      ),
    );
  }

  Expanded bookDetail() {
    return const Expanded(
      child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          )),
    );
  }
}
