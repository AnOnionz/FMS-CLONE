import 'dart:convert';

class ProjectEntity {
  final int id;
  final String name;
  final DateTime startDate;
  final DateTime? endDated;

  ProjectEntity(
    this.id,
    this.name,
    this.startDate,
    this.endDated,
  );

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
      map['id'] as int,
      map['name'] as String,
      DateTime.parse(map['startDate'] as String),
      map['startDate'] != null
          ? DateTime.parse(map['startDate'] as String)
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
      id ?? this.id,
      name ?? this.name,
      startDate ?? this.startDate,
      endDated ?? this.endDated,
    );
  }

  @override
  String toString() {
    return 'ProjectEntity(id: $id,  name: $name, startDate: $startDate, endDated: $endDated)';
  }
}
