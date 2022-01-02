// To parse this JSON data, do
//
//     final editProfileDto = editProfileDtoFromJson(jsonString);

import 'dart:convert';

EditProfileDto editProfileDtoFromJson(String str) =>
    EditProfileDto.fromJson(json.decode(str));

String editProfileDtoToJson(EditProfileDto data) => json.encode(data.toJson());

class EditProfileDto {
  EditProfileDto({
    this.userId,
    this.firstName,
    this.surname,
    this.userName,
    this.email,
    this.phoneNumber,
    this.address,
  });

  int? userId;
  String? firstName;
  String? surname;
  String? userName;
  String? email;
  String? phoneNumber;
  String? address;

  factory EditProfileDto.fromJson(Map<String, dynamic> json) => EditProfileDto(
        userId: json["userId"],
        firstName: json["firstName"],
        surname: json["surname"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "surname": surname,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
