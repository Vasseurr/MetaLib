// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/text/label_text.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/auth/controller/auth_controller.dart';
import 'package:getx_starter/view/auth/model/DTO/register_dto.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class RegisterPage extends GetView<HomeController> {
  RegisterPage({Key? key}) : super(key: key);
  RegisterDto _registerDto = new RegisterDto();
  var _formKey = GlobalKey<FormState>();

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
          margin: context.marginHeightMedium,
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                children: [
                  header(context),
                  //logo
                  SizedBox(height: context.getHeight * 0.05),
                  firstName(),
                  SizedBox(height: context.getHeight * 0.01),
                  surname(),
                  SizedBox(height: context.getHeight * 0.01),
                  userName(),
                  SizedBox(height: context.getHeight * 0.01),
                  password(context),
                  SizedBox(height: context.getHeight * 0.01),
                  email(),
                  SizedBox(height: context.getHeight * 0.01),
                  phoneNumber(),
                  SizedBox(height: context.getHeight * 0.01),
                  address(),
                  SizedBox(height: context.getHeight * 0.01),
                  registerButton(context),
                ],
              ),
            ),
          ),

          /*GetX<AuthController>(
              initState: (state) async {},
              builder: (_) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "",
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: Column(
                          children: [],
                        ),
                      ),
                    ),
                  ],
                );
              }),*/
        ),
      ),
    );
  }

  header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.getHeight * 0.05),
      child: Center(
        child: LabelText(
            label: "METALIB KAYIT",
            textColor: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500),
        /*Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),*/
      ),
    );
  }

  firstName() {
    return VasseurrTFF(
      icon: const Icon(Icons.person),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "İsim",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.firstName = value;
        //dto.name = value;
      },
    );
  }

  surname() {
    return VasseurrTFF(
      icon: const Icon(Icons.person),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "Soyisim",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.surname = value;
      },
    );
  }

  userName() {
    return VasseurrTFF(
      icon: const Icon(Icons.person),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "Kullanıcı Adı",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.userName = value;
      },
    );
  }

  password(BuildContext context) {
    return Column(
      children: [
        VasseurrTFF(
          icon: const Icon(Icons.lock),
          fillColor: Colors.white,
          textColor: Colors.black,
          radius: 8,
          borderColor: Colors.white,
          maxLength: 30,
          borderWidth: 0.5,
          obsecureText: true,
          hintText: "Şifre",
          hintColor: Colors.black,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return "Bu alan zorunludur!";
            }
          },
          onSaved: (value) {
            _registerDto.password = value;
          },
        ),
        SizedBox(height: context.getHeight * 0.01),
        VasseurrTFF(
          icon: const Icon(Icons.lock),
          fillColor: Colors.white,
          textColor: Colors.black,
          radius: 8,
          maxLength: 30,
          borderColor: Colors.white,
          borderWidth: 0.5,
          obsecureText: true,
          hintText: "Şifre Onay",
          hintColor: Colors.black,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return "Bu alan zorunludur!";
            }
          },
          onSaved: (value) {
            Get.find<AuthController>().confirmPassword = value;
          },
        )
      ],
    );
  }

  email() {
    return VasseurrTFF(
      icon: const Icon(Icons.email),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "E-posta",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.email = value;
      },
    );
  }

  phoneNumber() {
    return VasseurrTFF(
      icon: const Icon(Icons.phone),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "Telefon numarası",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.phoneNumber = value;
      },
    );
  }

  address() {
    return VasseurrTFF(
      icon: const Icon(Icons.map),
      fillColor: Colors.white,
      textColor: Colors.black,
      radius: 8,
      borderColor: Colors.white,
      borderWidth: 0.5,
      hintText: "Adres",
      hintColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 40,
      validator: (value) {
        if (value!.isEmpty) {
          return "Bu alan zorunludur!";
        }
      },
      onSaved: (value) {
        _registerDto.address = value;
      },
    );
  }

  registerButton(BuildContext context) {
    return VasseurrBttn(
        buttonText: "KAYIT OL",
        fontSize: 20,
        buttonColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        borderColor: Colors.deepOrangeAccent,
        height: context.getHeight * 0.07,
        width: context.getWidth,
        radius: 20,
        onPressed: () {
          var _controller = Get.find<AuthController>();
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (_controller.confirmPassword != _registerDto.password) {
              Utils.instance.showSnackBar(context,
                  content: "Girilen parolalar eşleşmiyor");
            } else {
              Get.find<AuthController>().register(_registerDto, context);
            }
          }
        });
  }
}
