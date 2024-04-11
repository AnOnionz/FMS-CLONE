import 'dart:convert';

import 'package:isar/isar.dart';

part 'project_entity.g.dart';

@embedded
class ProjectEntity {
  int? id;
  String? name;
  DateTime? startDate;
  DateTime? endDated;

  ProjectEntity({
    this.id,
    this.name,
    this.startDate,
    this.endDated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDated': endDated,
    };
  }

  factory ProjectEntity.fromMap(Map<String, dynamic> map) {
    return ProjectEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      startDate: DateTime.parse(map['startDate'] as String),
      endDated: map['endDated'] != null
          ? DateTime.parse(map['endDated'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectEntity.fromJson(String source) =>
      ProjectEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  ProjectEntity copyWith({
    int? id,
    bool? isActive,
    String? name,
    DateTime? startDate,
    DateTime? endDated,
    String? status,
  }) {
    return ProjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDated: endDated ?? this.endDated,
    );
  }

  @override
  String toString() {
    return 'ProjectEntity(id: $id,  name: $name, startDate: $startDate, endDated: $endDated)';
  }
}
