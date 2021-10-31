import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/text/text_form_field.dart';
import 'package:getx_starter/core/extension/context_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      body: Container(
        height: context.getHeight,
        margin: context.marginWidthHigh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(context),
            email(),
            spacer(context, 0.03, 1),
            password(),
            spacer(context, 0.015, 1),
            forgotPassword(),
            remember(context),
            spacer(context, 0.025, 1),
            buttons(context),
            spacer(context, 0.02, 1),
            signUp(context)
          ],
        ),
      ),
    );
  }

  SizedBox signUp(BuildContext context) {
    return SizedBox(
      width: context.getWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an Account?",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          spacer(context, 0.02, 2),
          InkWell(
              onTap: () {},
              child: const Text(
                "Sign up",
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
        RuzgarButton(
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
                setState(() {
                  rememberMe = value!;
                });
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
              "Password",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
        const SizedBox(
          height: 10,
        ),
        RuzgarTFF(
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
        )
      ],
    );
  }

  Column email() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Email",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
        const SizedBox(
          height: 10,
        ),
        RuzgarTFF(
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
          hintText: "Enter your Email",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
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
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
    );
  }
}
