import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/view/auth/controller/auth_controller.dart';
import 'package:getx_starter/view/auth/model/DTO/login_dto.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';
import 'package:hive/hive.dart';

class LoginPage extends GetView<AuthController> {
  bool rememberMe = false;
  var _formKey = GlobalKey<FormState>();
  LoginDto _loginDto = new LoginDto();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [context.specialRed, context.specialYellow])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(
              top: context.topHeightValue,
              left: context.highWidthValue,
              right: context.highWidthValue),
          child: GetX<AuthController>(
            initState: (state) {},
            builder: (_) {
              return _.isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // header(context),
                            //logo
                            spacer(context, 0.03, 1),
                            username(),
                            spacer(context, 0.05, 1),
                            password(),
                            spacer(context, 0.03, 1),
                            forgotPassword(),
                            // remember(context),
                            spacer(context, 0.15, 1),
                            loginButton(_loginDto, context),
                            //buttons(context),
                            spacer(context, 0.05, 1),
                            signUp(context)
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  VasseurrBttn loginButton(LoginDto _loginDTO, BuildContext context) {
    return VasseurrBttn(
        buttonText: "GİRİŞ YAP",
        fontSize: 20,
        buttonColor: Colors.grey,
        textColor: Colors.white,
        borderColor: Colors.grey,
        height: context.getHeight * 0.07,
        width: context.getWidth,
        radius: 20,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Get.find<AuthController>().login(_loginDTO, context);
          }
        });
  }

  SizedBox signUp(BuildContext context) {
    return SizedBox(
      width: context.getWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hesabın yok mu, ",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          spacer(context, 0.02, 2),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: const Text(
                "Kayıt Ol",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ],
      ),
    );
  }

  Column buttons(BuildContext context) {
    return Column(
      children: [
        VasseurrBttn(
            buttonText: "LOGIN",
            fontSize: 16,
            buttonColor: Colors.white,
            textColor: Colors.blue[800]!,
            height: context.getHeight * 0.07,
            width: context.getWidth,
            radius: 20,
            onPressed: () {}),
        spacer(context, 0.015, 1),
        const Text(
          "- OR -",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        spacer(context, 0.03, 1),
        const Text(
          "Sign in with",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
        ),
        spacer(context, 0.03, 1),
        SizedBox(
            height: context.getHeight * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    child: InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.blue,
                      ),
                    ), // Icon widget changed with FaIcon
                    backgroundColor: Colors.white),
                spacer(context, 0.1, 2),
                CircleAvatar(
                    child: InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                      ),
                    ), // Icon widget changed with FaIcon
                    backgroundColor: Colors.white),
              ],
            ))
      ],
    );
  }

  Align forgotPassword() {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {},
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Align remember(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        width: context.getWidth * 0.4,
        child: Row(
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.all(Colors.white),
              checkColor: Colors.blue,
              value: rememberMe,
              onChanged: (bool? value) {
                rememberMe = value!;
              },
            ),
            const Text(
              "Remember Me",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Column password() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Şifre",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
        const SizedBox(
          height: 10,
        ),
        VasseurrTFF(
          // fillColor: Color(int.parse("0x1597E5")),
          fillColor: Colors.white12,
          textColor: Colors.white,
          icon: const Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          radius: 8,
          borderColor: Colors.white12,
          borderWidth: 0.5,
          obsecureText: true,
          hintText: "******",
          textInputAction: TextInputAction.done,
          onSaved: (value) => _loginDto.password = value,
        )
      ],
    );
  }

  Column username() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Kullanıcı Adı",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
        const SizedBox(
          height: 10,
        ),
        VasseurrTFF(
          // fillColor: Color(int.parse("0x1597E5")),
          fillColor: Colors.white12,
          textColor: Colors.white,
          icon: const Icon(
            Icons.mail_outline,
            color: Colors.white,
          ),
          radius: 8,
          borderColor: Colors.white12,
          borderWidth: 0.5,
          hintText: "Kullanıcı Adı",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSaved: (value) => _loginDto.userName = value,
        )
      ],
    );
  }

  SizedBox spacer(BuildContext context, double value, int type) {
    return type == 1
        ? SizedBox(height: context.getHeight * value)
        : SizedBox(width: context.getWidth * value);
  }

  Container header(BuildContext context) {
    return Container(
      margin: context.marginHeightMedium,
      child: const Center(
        child: Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
    );
  }
}
