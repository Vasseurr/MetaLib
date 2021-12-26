// To parse this JSON data, do
//
//     final attendLibraryDto = attendLibraryDtoFromJson(jsonString);

import 'dart:convert';

AttendLibraryDto attendLibraryDtoFromJson(String str) =>
    AttendLibraryDto.fromJson(json.decode(str));

String attendLibraryDtoToJson(AttendLibraryDto data) =>
    json.encode(data.toJson());

class AttendLibraryDto {
  AttendLibraryDto({
    this.userId,
    this.libId,
  });

  int? userId;
  int? libId;

  factory AttendLibraryDto.fromJson(Map<String, dynamic> json) =>
      AttendLibraryDto(
        userId: json["userId"],
        libId: json["libId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "libId": libId,
      };
}
