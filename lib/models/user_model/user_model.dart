// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  UserModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromMap(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toMap() => {
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toMap())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    maidenName: json["maidenName"],
    age: json["age"],
    gender: json["gender"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    password: json["password"],
    birthDate: json["birthDate"],
    image: json["image"],
    bloodGroup: json["bloodGroup"],
    height: json["height"]?.toDouble(),
    weight: json["weight"]?.toDouble(),
    eyeColor: json["eyeColor"],
    hair: json["hair"] == null ? null : Hair.fromMap(json["hair"]),
    ip: json["ip"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
    macAddress: json["macAddress"],
    university: json["university"],
    bank: json["bank"] == null ? null : Bank.fromMap(json["bank"]),
    company: json["company"] == null ? null : Company.fromMap(json["company"]),
    ein: json["ein"],
    ssn: json["ssn"],
    userAgent: json["userAgent"],
    crypto: json["crypto"] == null ? null : Crypto.fromMap(json["crypto"]),
    role: json["role"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "maidenName": maidenName,
    "age": age,
    "gender": gender,
    "email": email,
    "phone": phone,
    "username": username,
    "password": password,
    "birthDate": birthDate,
    "image": image,
    "bloodGroup": bloodGroup,
    "height": height,
    "weight": weight,
    "eyeColor": eyeColor,
    "hair": hair?.toMap(),
    "ip": ip,
    "address": address?.toMap(),
    "macAddress": macAddress,
    "university": university,
    "bank": bank?.toMap(),
    "company": company?.toMap(),
    "ein": ein,
    "ssn": ssn,
    "userAgent": userAgent,
    "crypto": crypto?.toMap(),
    "role": role,
  };
}

class Address {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    state: json["state"],
    stateCode: json["stateCode"],
    postalCode: json["postalCode"],
    coordinates: json["coordinates"] == null ? null : Coordinates.fromMap(json["coordinates"]),
    country: json["country"],
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "city": city,
    "state": state,
    "stateCode": stateCode,
    "postalCode": postalCode,
    "coordinates": coordinates?.toMap(),
    "country": country,
  };
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "lng": lng,
  };
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    cardExpire: json["cardExpire"],
    cardNumber: json["cardNumber"],
    cardType: json["cardType"],
    currency: json["currency"],
    iban: json["iban"],
  );

  Map<String, dynamic> toMap() => {
    "cardExpire": cardExpire,
    "cardNumber": cardNumber,
    "cardType": cardType,
    "currency": currency,
    "iban": iban,
  };
}

class Company {
  String? department;
  String? name;
  String? title;
  Address? address;

  Company({
    this.department,
    this.name,
    this.title,
    this.address,
  });

  factory Company.fromMap(Map<String, dynamic> json) => Company(
    department: json["department"],
    name: json["name"],
    title: json["title"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
  );

  Map<String, dynamic> toMap() => {
    "department": department,
    "name": name,
    "title": title,
    "address": address?.toMap(),
  };
}

class Crypto {
  String? coin;
  String? wallet;
  String? network;

  Crypto({
    this.coin,
    this.wallet,
    this.network,
  });

  factory Crypto.fromMap(Map<String, dynamic> json) => Crypto(
    coin: json["coin"],
    wallet: json["wallet"],
    network: json["network"],
  );

  Map<String, dynamic> toMap() => {
    "coin": coin,
    "wallet": wallet,
    "network": network,
  };
}

class Hair {
  String? color;
  String? type;

  Hair({
    this.color,
    this.type,
  });

  factory Hair.fromMap(Map<String, dynamic> json) => Hair(
    color: json["color"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "color": color,
    "type": type,
  };
}
