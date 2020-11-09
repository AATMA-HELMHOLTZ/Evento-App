import 'package:flutter/material.dart';


class Vendor {
  String name;
  String city;
  List<Null> orders;
  String sId;
  String email;
  String password;
  int mobile;
  int iV;
  String id;

  Vendor(
      {this.name,
        this.city,
        this.orders,
        this.sId,
        this.email,
        this.password,
        this.mobile,
        this.iV,
        this.id});

  Vendor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    if (json['orders'] != null) {
      orders = new List<Null>();
      json['orders'].forEach((v) {
        orders.add(new Null.fromJson(v));
      });
    }
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
