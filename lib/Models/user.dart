// // To parse this JSON data, do
// //
// //     final user = userFromJson(jsonString);
//
// import 'dart:convert';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   User({
//     this.status,
//     this.users,
//   });
//
//   String status;
//   List<UserElement> users;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     status: json["status"],
//     users: List<UserElement>.from(json["Users"].map((x) => UserElement.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "Users": List<dynamic>.from(users.map((x) => x.toJson())),
//   };
// }
//
// class UserElement {
//   UserElement({
//     this.name,
//     this.city,
//     this.orders,
//     this.id,
//     this.email,
//     this.password,
//     this.mobile,
//     this.v,
//     this.userId,
//   });
//
//   String name;
//   String city;
//   List<dynamic> orders;
//   String id;
//   String email;
//   String password;
//   int mobile;
//   int v;
//   String userId;
//
//   factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
//     name: json["name"],
//     city: json["city"],
//     orders: List<dynamic>.from(json["orders"].map((x) => x)),
//     id: json["_id"],
//     email: json["email"],
//     password: json["password"],
//     mobile: json["mobile"] == null ? null : json["mobile"],
//     v: json["__v"],
//     userId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "city": city,
//     "orders": List<dynamic>.from(orders.map((x) => x)),
//     "email": email,
//     "password": password,
//     "mobile": mobile == null ? null : mobile,
//
//   };
// }

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ProfileModel {
  String name;
  String appPassword;
  String username;
  int mobile;
  String img;
  String city;
  ProfileModel(
      {this.name,
        this.appPassword,
        this.username,
        this.mobile,
        this.img,
        this.city});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

Map<String, dynamic> $ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'appPassword': instance.appPassword,
      'mobile': instance.mobile,
      'city': instance.city,
      'img': instance.img
    };