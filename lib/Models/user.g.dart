// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    name: json['name'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    city: json['city'] as String,
    //pic: json['titleline'] as String,
    mobile: json['mobile'] as int,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'city': instance.city,
      'phone': instance.mobile,
      //'about': instance.about,
    };