// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:getx_starter/view/home/model/DAO/edit_profile.dart';

//class ProfilePage extends GetView<HomeController> {
class EditProfile extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  EditProfileDto _editProfileDto = new EditProfileDto();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: context.marginWidthLow,
          child: Get.find<HomeController>().checkUserSession() == true
              //child: _.checkUserSession() == true
              ? infos(context)
              : authButtons(context)),
    );
  }

  infos(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          textField("Kullanıcı Adı",
              HiveManager.getStringValue(HiveKeys.USERNAME) ?? "temp", context),
          textField(
              "İsim",
              HiveManager.getStringValue(HiveKeys.FIRSTNAME) ?? "temp",
              context),
          textField("Soyisim",
              HiveManager.getStringValue(HiveKeys.SURNAME) ?? "temp", context),
          textField("E-posta",
              HiveManager.getStringValue(HiveKeys.EMAIL) ?? "temp", context),
          textField("Telefon Numarası",
              HiveManager.getStringValue(HiveKeys.PHONE) ?? "temp", context),
          textField("Adres",
              HiveManager.getStringValue(HiveKeys.ADDRESS) ?? "temp", context),
          Spacer(),
          Container(
              margin: EdgeInsets.only(
                  left: context.getWidth * 0.15,
                  right: context.getWidth * 0.15),
              child: VasseurrBttn(
                  buttonText: "Kaydet",
                  buttonColor: context.specialBlack,
                  borderColor: context.specialBlack,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Get.find<HomeController>()
                          .editProfile(_editProfileDto, context);
                    }
                  })),
        ],
      ),
    );
  }

  Padding authButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.getWidth * 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VasseurrBttn(
              width: context.getWidth * 0.4,
              buttonText: "Giriş Yap",
              buttonColor: context.specialBlack,
              borderColor: context.specialBlack,
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              }),
          VasseurrBttn(
              width: context.getWidth * 0.4,
              buttonText: "Kayıt Ol",
              buttonColor: context.specialBlack,
              borderColor: context.specialBlack,
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              })
        ],
      ),
    );
  }

  Container textField(String fieldName, String value, BuildContext context) {
    return Container(
      height: context.getHeight * 0.08,
      margin: context.marginWidthLow,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 2))),
      child: Container(
        margin: EdgeInsets.only(
            left: context.getWidth * 0.05, right: context.getWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: context.getWidth * 0.3,
                child: Text(fieldName, style: TextStyle(color: Colors.white))),
            SizedBox(width: context.getWidth * 0.15),
            SizedBox(
                width: context.getWidth * 0.4,
                child: VasseurrTFF(
                  fillColor: Colors.transparent,
                  textColor: Colors.white,
                  radius: 8,
                  borderColor: Colors.transparent,
                  borderWidth: 0.5,
                  hintText: value,
                  hintColor: Colors.white,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  /*  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bu alan zorunludur!";
                    }
                  },*/
                  onSaved: (value) {
                    switch (fieldName) {
                      case "Kullanıcı Adı":
                        _editProfileDto.userName = value;
                        break;
                      case "İsim":
                        _editProfileDto.firstName = value;
                        break;
                      case "Soyisim":
                        _editProfileDto.surname = value;
                        break;
                      case "E-posta":
                        _editProfileDto.email = value;
                        break;
                      case "Telefon Numarası":
                        _editProfileDto.phoneNumber = value;
                        break;
                      case "Adres":
                        _editProfileDto.address = value;
                        break;
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
