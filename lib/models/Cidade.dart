// To parse this JSON data, do
//
//     final cidade = cidadeFromJson(jsonString);

import 'dart:convert';

Cidade cidadeFromJson(String str) => Cidade.fromJson(json.decode(str));

String cidadeToJson(Cidade data) => json.encode(data.toJson());

class Cidade {
  String objectId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Cidade({
    this.objectId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Cidade.fromJson(Map<String, dynamic> json) => Cidade(
        objectId: json["objectId"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  static List<Cidade> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Cidade.fromJson(item)).toList();
  }

  @override
  String toString() => name;
}
