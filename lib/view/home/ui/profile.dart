// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';
import 'package:getx_starter/core/extension/context_extension.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String imageLink =
        "https://www.seekpng.com/png/detail/1010-10108361_person-icon-circle.png";
    return Container(
      margin: context.marginWidthLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: context.getHeight * 0.15,
            width: context.getWidth * 0.25,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageLink),
            ),
          ),
          Spacer(),
          textField("Kullanıcı Adı", "OkanRZGR", context),
          textField("İsim", "Okan", context),
          textField("Soyisim", "Rüzgar", context),
          textField("E-posta", "okan@gmail.com", context),
          textField("Telefon Numarası", "+90 (538) 856 8569", context),
          textField("Adres", "Hürriyet Mahallesi 67/8 Bahçelievler/İstanbul",
              context),
          Spacer(),
          Container(
              margin: EdgeInsets.only(
                  left: context.getWidth * 0.15,
                  right: context.getWidth * 0.15),
              child: VasseurrBttn(
                  buttonText: "Çıkış Yap",
                  buttonColor: context.specialBlack,
                  borderColor: context.specialBlack,
                  onPressed: () {})),
        ],
      ),
    );
  }

  Container textField(String fieldName, String value, BuildContext context) {
    return Container(
      height: context.getHeight * 0.08,
      margin: context.marginWidthLow,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: context.specialYellow, width: 2))),
      child: Container(
        margin: EdgeInsets.only(
            left: context.getWidth * 0.05, right: context.getWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: context.getWidth * 0.3, child: Text(fieldName)),
            SizedBox(width: context.getWidth * 0.15),
            SizedBox(width: context.getWidth * 0.4, child: Text(value))
          ],
        ),
      ),
    );
  }
}
