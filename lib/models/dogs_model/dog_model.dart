// To parse this JSON data, do
//
//     final dogModel = dogModelFromMap(jsonString);

import 'dart:convert';

List<DogModel> dogModelFromMap(String str) => List<DogModel>.from(json.decode(str).map((x) => DogModel.fromMap(x)));

String dogModelToMap(List<DogModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DogModel {
  int? id;
  String? name;
  String? breedGroup;
  String? size;
  String? lifespan;
  String? origin;
  String? temperament;
  List<String>? colors;
  String? description;
  String? image;

  DogModel({
    this.id,
    this.name,
    this.breedGroup,
    this.size,
    this.lifespan,
    this.origin,
    this.temperament,
    this.colors,
    this.description,
    this.image,
  });

  factory DogModel.fromMap(Map<String, dynamic> json) => DogModel(
    id: json["id"],
    name: json["name"],
    breedGroup: json["breed_group"],
    size: json["size"],
    lifespan: json["lifespan"],
    origin: json["origin"],
    temperament: json["temperament"],
    colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "breed_group": breedGroup,
    "size": size,
    "lifespan": lifespan,
    "origin": origin,
    "temperament": temperament,
    "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
    "description": description,
    "image": image,
  };
}
