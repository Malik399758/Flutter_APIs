// To parse this JSON data, do
//
//     final user1Model = user1ModelFromMap(jsonString);

import 'dart:convert';

List<User1Model> user1ModelFromMap(String str) => List<User1Model>.from(json.decode(str).map((x) => User1Model.fromMap(x)));

String user1ModelToMap(List<User1Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User1Model {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User1Model({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User1Model.fromMap(Map<String, dynamic> json) => User1Model(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: json["company"] == null ? null : Company.fromMap(json["company"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toMap(),
    "phone": phone,
    "website": website,
    "company": company?.toMap(),
  };
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: json["geo"] == null ? null : Geo.fromMap(json["geo"]),
  );

  Map<String, dynamic> toMap() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo?.toMap(),
  };
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
