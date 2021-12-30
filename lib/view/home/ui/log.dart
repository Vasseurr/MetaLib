import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class Log extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      initState: (state) async {
        if (Get.find<HomeController>().checkUserSession()) {
          Get.find<HomeController>().getLogs(context);
        }
      },
      builder: (_) {
        return _.isLoading == false
            ? Get.find<HomeController>().checkUserSession() == false
                ? const Center(
                    child: Text(
                    "Lütfen giriş yapınız",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
                : Get.find<HomeController>().logs.logs.length == 0
                    ? const Center(
                        child: Text(
                        "Herhangi bir log bilgisi bulunmamaktadır",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            tableHeader(),
                            //SizedBox(height: context.getHeight * 0.03),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                          height: context.getHeight * 0.03),
                                      tableRows(
                                          _.logs.logs[index].enterDate,
                                          "GİRİŞ",
                                          _.logs.logs[index].libName,
                                          Colors.green),
                                      SizedBox(
                                          height: context.getHeight * 0.03),
                                      _.logs.logs[index].leaveDate == ""
                                          ? const SizedBox()
                                          : tableRows(
                                              _.logs.logs[index].leaveDate,
                                              "ÇIKIŞ",
                                              _.logs.logs[index].libName,
                                              Colors.white),
                                    ],
                                  );
                                },
                                itemCount: _.logs.logs.length,
                              ),
                            ),
                            /*   tableRows("27/10/2021", "GİRİŞ", "Fatih Kütüphanesi",
                        Colors.green),
                    SizedBox(height: context.getHeight * 0.03),
                    tableRows("28/10/2021", "ÇIKIŞ", "Fatih Kütüphanesi",
                        Colors.red),*/
                          ],
                        ),
                      )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Row tableHeader() {
    return Row(
      children: [
        Expanded(flex: 3, child: Center(child: header("Tarih"))),
        Expanded(flex: 3, child: Center(child: header("İşlem Tipi"))),
        Expanded(flex: 4, child: Center(child: header("Kütüphane")))
      ],
    );
  }

  tableRows(String date, String type, String library, Color color) {
    return Row(
      children: [
        Expanded(flex: 3, child: Center(child: value(date, color))),
        Expanded(flex: 3, child: Center(child: value(type, color))),
        Expanded(flex: 4, child: Center(child: value(library, color))),
      ],
    );
  }

  header(String value) {
    return Text(
      value,
      style: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  value(String value, Color color) {
    return Text(
      value,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
