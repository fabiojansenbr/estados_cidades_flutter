// To parse this JSON data, do
//
//     final estado = estadoFromJson(jsonString);

import 'dart:convert';

Estado estadoFromJson(String str) => Estado.fromJson(json.decode(str));

String estadoToJson(Estado data) => json.encode(data.toJson());

class Estado {
  String objectId;
  String code;
  String native;
  String name;
  String geonameid;
  DateTime createdAt;
  DateTime updatedAt;
  Cities cities;

  Estado({
    this.objectId,
    this.code,
    this.native,
    this.name,
    this.geonameid,
    this.createdAt,
    this.updatedAt,
    this.cities,
  });

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        objectId: json["objectId"],
        code: json["code"],
        native: json["native"],
        name: json["name"],
        geonameid: json["geonameid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cities: Cities.fromJson(json["cities"]),
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "code": code,
        "native": native,
        "name": name,
        "geonameid": geonameid,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cities": cities.toJson(),
      };

  static List<Estado> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Estado.fromJson(item)).toList();
  }

  @override
  String toString() => name;
}

class Cities {
  String type;
  String className;

  Cities({
    this.type,
    this.className,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        type: json["__type"],
        className: json["className"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "className": className,
      };
}
