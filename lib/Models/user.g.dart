// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    name: json['name'] as String,
    username: json['username'] as String,
    appPassword: json['appPassword'] as String,
    city: json['city'] as String,
    img: json['img'] as String,
    mobile: json['mobile'] as int,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'appPassword': instance.appPassword,
      'city': instance.city,
      'phone': instance.mobile,
      'img': instance.img,
    };