import 'package:flutter_rocket/flutter_rocket.dart';

const String categoryIdField = "id";
const String categoryNameField = "name";
const String categoryImageField = "image";
const String categoryCreationAtField = "creationAt";
const String categoryUpdatedAtField = "updatedAt";

class Category extends RocketModel<Category> {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  @override
  void fromJson(Map<String, dynamic>? json, {bool isSub = false}) {
    if(json == null) return;
    id = json[categoryIdField];
    name = json[categoryNameField];
    image = json[categoryImageField];
    creationAt = json[categoryCreationAtField];
    updatedAt = json[categoryUpdatedAtField];
    super.fromJson(json, isSub: isSub);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[categoryIdField] = id;
    data[categoryNameField] = name;
    data[categoryImageField] = image;
    data[categoryCreationAtField] = creationAt;
    data[categoryUpdatedAtField] = updatedAt;

    return data;
  }

  @override
  get instance => Category();
}
