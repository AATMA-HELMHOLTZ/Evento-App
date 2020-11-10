import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;

class Vendor {
  String name;
  double minPrice;
  String image;
  String email;
  int mobile;
  String review;
  int rating;
  String city;
  String password;

  Vendor(
      {this.name,
        this.city,
        this.image,
        this.email,
        this.password,
        this.mobile,
        this.minPrice,
        this.rating,
        this.review
      });

  // void addUser({Vendor vendor}) {
  //   this.name = user.name;
  //   this.mobile = user.mobile;
  //   this.city = user.city;
  //   this.email = user.email;
  //   //this.sId = user.sId;
  //   this.password = user.password;
  //
  // }

}
