// To parse this JSON data, do
//
//     final registerDto = registerDtoFromJson(jsonString);

import 'dart:convert';

RegisterDto registerDtoFromJson(String str) =>
    RegisterDto.fromJson(json.decode(str));

String registerDtoToJson(RegisterDto data) => json.encode(data.toJson());

class RegisterDto {
  RegisterDto({
    this.firstName,
    this.surname,
    this.userName,
    this.password,
    this.email,
    this.phoneNumber,
    this.address,
  });

  String? firstName;
  String? surname;
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? address;

  factory RegisterDto.fromJson(Map<String, dynamic> json) => RegisterDto(
        firstName: json["firstName"],
        surname: json["surname"],
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "surname": surname,
        "userName": userName,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
