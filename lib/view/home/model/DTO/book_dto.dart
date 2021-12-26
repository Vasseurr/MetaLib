class Book {
  Book({
    this.id,
    this.isOwner,
    this.belongLibName,
    this.name,
    this.imagePath,
    this.author,
    this.type,
    this.totalPage,
    this.barcode,
    this.description,
  });

  int? id;
  bool? isOwner;
  String? belongLibName;
  String? name;
  String? imagePath;
  String? author;
  String? type;
  int? totalPage;
  String? barcode;
  String? description;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        isOwner: json["isOwner"],
        belongLibName: json["belongLibName"],
        name: json["name"],
        imagePath: json["imagePath"],
        author: json["author"],
        type: json["type"],
        totalPage: json["totalPage"],
        barcode: json["barcode"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isOwner": isOwner,
        "belongLibName": belongLibName,
        "name": name,
        "imagePath": imagePath,
        "author": author,
        "type": type,
        "totalPage": totalPage,
        "barcode": barcode,
        "description": description,
      };
}
