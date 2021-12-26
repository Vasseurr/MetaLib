// To parse this JSON data, do
//
//     final leaveLibraryDto = leaveLibraryDtoFromJson(jsonString);

import 'dart:convert';

LeaveLibraryDto leaveLibraryDtoFromJson(String str) =>
    LeaveLibraryDto.fromJson(json.decode(str));

String leaveLibraryDtoToJson(LeaveLibraryDto data) =>
    json.encode(data.toJson());

class LeaveLibraryDto {
  LeaveLibraryDto({
    this.userId,
    this.libId,
    this.logId,
  });

  int? userId;
  int? libId;
  int? logId;

  factory LeaveLibraryDto.fromJson(Map<String, dynamic> json) =>
      LeaveLibraryDto(
        userId: json["userId"],
        libId: json["libId"],
        logId: json["logId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "libId": libId,
        "logId": logId,
      };
}
