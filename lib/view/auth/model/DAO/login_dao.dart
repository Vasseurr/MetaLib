// To parse this JSON data, do
//
//     final loginDao = loginDaoFromJson(jsonString);

import 'dart:convert';

LoginDao loginDaoFromJson(String str) => LoginDao.fromJson(json.decode(str));

String loginDaoToJson(LoginDao data) => json.encode(data.toJson());

class LoginDao {
  LoginDao({
    this.status,
    this.textFromApi,
    this.time,
    this.userId,
    this.firstName,
    this.surname,
    this.userName,
    this.email,
    this.phoneNumber,
    this.address,
  });

  bool? status;
  String? textFromApi;
  String? time;
  String? userId;
  String? firstName;
  String? surname;
  String? userName;
  String? email;
  String? phoneNumber;
  String? address;

  factory LoginDao.fromJson(Map<String, dynamic> json) => LoginDao(
        status: json["status"],
        textFromApi: json["textFromApi"],
        time: json["time"],
        userId: json["userId"],
        firstName: json["firstName"],
        surname: json["surname"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "textFromApi": textFromApi,
        "time": time,
        "userId": userId,
        "firstName": firstName,
        "surname": surname,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
