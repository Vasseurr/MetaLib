// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.country,
  });

  String? name;
  List<Country>? country;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        country: json["country"] == null
            ? null
            : List<Country>.from(
                json["country"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "country": country == null
            ? null
            : List<dynamic>.from(country!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.countryId,
    this.probability,
  });

  String? countryId;
  double? probability;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"] == null ? null : json["country_id"],
        probability:
            json["probability"] == null ? null : json["probability"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId == null ? null : countryId,
        "probability": probability == null ? null : probability,
      };
}
