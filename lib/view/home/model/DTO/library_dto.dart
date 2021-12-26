class Library {
  Library({
    this.libId,
    this.name,
    this.imgPath,
    this.currentCapacity,
    this.totalCapacity,
    this.address,
    this.phoneNumber,
    this.isAvailable,
  });

  int? libId;
  String? name;
  String? imgPath;
  int? currentCapacity;
  int? totalCapacity;
  String? address;
  String? phoneNumber;
  bool? isAvailable;

  factory Library.fromJson(Map<String, dynamic> json) => Library(
        libId: json["libId"],
        name: json["name"],
        imgPath: json["imgPath"],
        currentCapacity: json["currentCapacity"],
        totalCapacity: json["totalCapacity"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "libId": libId,
        "name": name,
        "imgPath": imgPath,
        "currentCapacity": currentCapacity,
        "totalCapacity": totalCapacity,
        "address": address,
        "phoneNumber": phoneNumber,
        "isAvailable": isAvailable,
      };
}
