import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/text/label_text.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/view/auth/controller/auth_controller.dart';
import 'package:getx_starter/view/home/controller/home_controller.dart';

class RegisterPage extends GetView<HomeController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      body: Container(
        margin: context.marginHeightMedium,
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              children: [
                //  header(context),
                //logo
                SizedBox(height: context.getHeight * 0.1),
                nameField(),
                SizedBox(height: context.getHeight * 0.03),
                lastNameField(),
                SizedBox(height: context.getHeight * 0.03),
                passwordField(context),
                SizedBox(height: context.getHeight * 0.07),
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
    );
  }

  header(BuildContext context) {
    return Container(
      margin: context.marginHeightLow,
      child: Center(
        child: LabelText(
            label: "Register",
            textColor: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        /*Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),*/
      ),
    );
  }

  nameField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: LabelText(
            label: "First Name",
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: VasseurrTFF(
            fillColor: Colors.white12,
            textColor: Colors.white,
            radius: 8,
            borderColor: Colors.white12,
            borderWidth: 0.5,
            hintText: "Enter your first name",
            hintColor: Colors.white24,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLength: 40,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
            },
            onSaved: (value) {
              //dto.name = value;
            },
          ),
        ),
      ],
    );
  }

  lastNameField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: LabelText(
            label: "Last Name",
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: VasseurrTFF(
            fillColor: Colors.white12,
            textColor: Colors.white,
            radius: 8,
            borderColor: Colors.white12,
            borderWidth: 0.5,
            hintText: "Enter your last name",
            hintColor: Colors.white24,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLength: 40,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
            },
            onSaved: (value) {
              //dto.name = value;
            },
          ),
        ),
      ],
    );
  }

  passwordField(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: LabelText(
              label: "Password",
              textColor: Colors.white,
            )),
        const SizedBox(height: 16),
        VasseurrTFF(
          // fillColor: Color(int.parse("0x1597E5")),
          fillColor: Colors.white12,
          textColor: Colors.white,
          radius: 8,
          borderColor: Colors.white12,
          maxLength: 30,
          borderWidth: 0.5,
          obsecureText: true,
          hintText: "******",
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return "This field is required";
            }
          },
          onSaved: (value) {
            //dto.name = value;
          },
        ),
        SizedBox(height: context.getHeight * 0.03),
        Container(
            alignment: Alignment.topLeft,
            child: LabelText(
              label: "Confirm Password",
              textColor: Colors.white,
            )),
        const SizedBox(height: 16),
        VasseurrTFF(
          // fillColor: Color(int.parse("0x1597E5")),
          fillColor: Colors.white12,
          textColor: Colors.white,
          radius: 8,
          maxLength: 30,
          borderColor: Colors.white12,
          borderWidth: 0.5,
          obsecureText: true,
          hintText: "******",
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return "This field is required";
            }
          },
          onSaved: (value) {
            //dto.name = value;
          },
        )
      ],
    );
  }

  registerButton(BuildContext context) {
    return VasseurrBttn(
        buttonText: "REGISTER",
        fontSize: 16,
        buttonColor: Colors.white,
        textColor: Colors.blue[800]!,
        height: context.getHeight * 0.07,
        width: context.getWidth,
        radius: 20,
        onPressed: () {});
  }
}
