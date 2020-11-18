// To parse this JSON data, do
//
//     final vendor = vendorFromJson(jsonString);

import 'dart:convert';

Vendor vendorFromJson(String str) => Vendor.fromJson(json.decode(str));

String vendorToJson(Vendor data) => json.encode(data.toJson());

class Vendor {
  Vendor({
    this.vendorDetails,
  });

  VendorDetails vendorDetails;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    vendorDetails: VendorDetails.fromJson(json["vendorDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "vendorDetails": vendorDetails.toJson(),
  };
}

class VendorDetails {
  VendorDetails({
    this.ratings,
    this.id,
    this.images,
    this.city,
    this.avgStar,
    this.name,
    this.number,
    this.email,
    this.service,
    this.description,
    this.minPrice,
  });

  List<dynamic> ratings;
  String id;
  List<String> images;
  String city;
  int avgStar;
  String name;
  int number;
  String email;
  String service;
  String description;
  int minPrice;

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
    ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
    id: json["_id"],
    images: List<String>.from(json["images"].map((x) => x)),
    city: json["city"],
    avgStar: json["avgStar"],
    name: json["name"],
    number: json["number"],
    email: json["email"],
    service: json["service"],
    description: json["description"],
    minPrice: json["minPrice"],
  );

  Map<String, dynamic> toJson() => {
    "ratings": List<dynamic>.from(ratings.map((x) => x)),
    "_id": id,
    "images": List<dynamic>.from(images.map((x) => x)),
    "city": city,
    "avgStar": avgStar,
    "name": name,
    "number": number,
    "email": email,
    "service": service,
    "description": description,
    "minPrice": minPrice,
  };
}
