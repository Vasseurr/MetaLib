// To parse this JSON data, do
//
//     final loginDto = loginDtoFromJson(jsonString);

import 'dart:convert';

LoginDto loginDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String loginDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
  LoginDto({
    this.userName,
    this.password,
  });

  String? userName;
  String? password;

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}
