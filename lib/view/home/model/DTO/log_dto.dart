class Log {
  Log({
    this.id,
    this.userId,
    this.libName,
    this.enterDate,
    this.leaveDate,
  });

  int? id;
  int? userId;
  String? libName;
  String? enterDate;
  String? leaveDate;

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        id: json["id"],
        userId: json["userId"],
        libName: json["libName"],
        enterDate: json["enterDate"],
        leaveDate: json["leaveDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "libName": libName,
        "enterDate": enterDate,
        "leaveDate": leaveDate,
      };
}
