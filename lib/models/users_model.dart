import 'package:mvc_rocket/mvc_rocket.dart';

const String usersmodelIdField = "id";
const String usersmodelEmailField = "email";
const String usersmodelPasswordField = "password";
const String usersmodelNameField = "name";
const String usersmodelRoleField = "role";
const String usersmodelAvatarField = "avatar";
const String usersmodelCreationAtField = "creationAt";
const String usersmodelUpdatedAtField = "updatedAt";

class UsersModel extends RocketModel<UsersModel> {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UsersModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  @override
  void fromJson(Map<String, dynamic> json, {bool isSub = false}) {
    id = json[usersmodelIdField];
    email = json[usersmodelEmailField];
    password = json[usersmodelPasswordField];
    name = json[usersmodelNameField];
    role = json[usersmodelRoleField];
    avatar = json[usersmodelAvatarField];
    creationAt = json[usersmodelCreationAtField];
    updatedAt = json[usersmodelUpdatedAtField];
    super.fromJson(json, isSub: isSub);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[usersmodelIdField] = id;
    data[usersmodelEmailField] = email;
    data[usersmodelPasswordField] = password;
    data[usersmodelNameField] = name;
    data[usersmodelRoleField] = role;
    data[usersmodelAvatarField] = avatar;
    data[usersmodelCreationAtField] = creationAt;
    data[usersmodelUpdatedAtField] = updatedAt;

    return data;
  }

  @override
  get instance => UsersModel();
}
