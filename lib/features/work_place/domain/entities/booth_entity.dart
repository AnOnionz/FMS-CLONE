import 'dart:convert';

import 'package:isar/isar.dart';

part 'booth_entity.g.dart';

@embedded
class BoothEntity {
  int? id;
  String? name;
  String? description;

  BoothEntity({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory BoothEntity.fromMap(Map<String, dynamic> map) {
    return BoothEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoothEntity.fromJson(String source) =>
      BoothEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoothEntity(id: $id, name: $name, description: $description)';
  }
}
