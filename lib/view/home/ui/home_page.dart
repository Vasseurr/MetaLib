import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(context.mediumHeightValue),
        child: GetX<HomeController>(
          initState: (state) async {
            Get.find<HomeController>().getUser();
            //box = await Hive.openBox('user');
          },
          builder: (_) {
            return Column(
              children: [
                Center(
                  //child: Obx(() => Text(controller.userName)),
                  child: Text(_.userName),
                ),
                const Spacer(),
                /*RuzgarButton(
                    buttonText: "Add user",
                    onPressed: () async {
                      await _.getUser();
                      //HiveManager.setStringValue('user', _.userName);
                      _.saveUser();
                    }),
                const Spacer(),*/
                RuzgarButton(
                    buttonText: "Save value",
                    onPressed: () async {
                      _.saveUser();
                    }),
                const Spacer(),
                RuzgarButton(
                    height: context.height * 0.08,
                    width: context.width * 0.4,
                    radius: 15,
                    buttonText: "Go to Second Page",
                    onPressed: () {
                      Get.toNamed(Routes.SECOND);
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
