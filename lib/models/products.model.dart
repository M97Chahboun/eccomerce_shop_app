import 'dart:developer';

import 'package:flutter_rocket/flutter_rocket.dart';

import 'categories_model.dart';

const String productIdField = "id";
const String productTitleField = "title";
const String productPriceField = "price";
const String productDescriptionField = "description";
const String productImagesField = "images";
const String productCreationAtField = "creationAt";
const String productUpdatedAtField = "updatedAt";
const String productCategoryField = "category";

class Product extends RocketModel<Product> {
  int? id;
  String? title;
  int? price;
  String? description;
  List<dynamic>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  }) {
    category ??= Category();
  }

  @override
  void fromJson(Map<String, dynamic>? json, {bool isSub = false}) {
    if(json == null) return;
    id = json[productIdField];
    title = json[productTitleField];
    price = json[productPriceField];
    description = json[productDescriptionField];
    images = json[productImagesField];
    creationAt = json[productCreationAtField];
    updatedAt = json[productUpdatedAtField];
    category!.fromJson(json[productCategoryField]);
    super.fromJson(json, isSub: isSub);
  }

  @override
  void setException(RocketException rocketException) {
    log(rocketException.exception.toString());
    super.setException(rocketException);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[productIdField] = id;
    data[productTitleField] = title;
    data[productPriceField] = price;
    data[productDescriptionField] = description;
    data[productImagesField] = images;
    data[productCreationAtField] = creationAt;
    data[productUpdatedAtField] = updatedAt;
    data[productCategoryField] = category!.toJson();

    return data;
  }

  @override
  get instance => Product();
}
