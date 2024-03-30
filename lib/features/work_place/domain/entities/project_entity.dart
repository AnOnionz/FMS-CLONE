import 'dart:convert';

class ProjectEntity {
  final int id;
  final bool isActive;
  final String name;
  final String startDate;
  final String? endDated;
  final String status;

  ProjectEntity(this.id, this.isActive, this.name, this.startDate,
      this.endDated, this.status);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'name': name,
      'startDate': startDate,
      'endDated': endDated,
      'status': status,
    };
  }

  factory ProjectEntity.fromMap(Map<String, dynamic> map) {
    return ProjectEntity(
      map['id'] as int,
      map['isActive'] as bool,
      map['name'] as String,
      map['startDate'] as String,
      map['endDated'] as String?,
      map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectEntity.fromJson(String source) =>
      ProjectEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  ProjectEntity copyWith({
    int? id,
    bool? isActive,
    String? name,
    String? startDate,
    String? endDated,
    String? status,
  }) {
    return ProjectEntity(
      id ?? this.id,
      isActive ?? this.isActive,
      name ?? this.name,
      startDate ?? this.startDate,
      endDated ?? this.endDated,
      status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'ProjectEntity(id: $id, isActive: $isActive, name: $name, startDate: $startDate, endDated: $endDated, status: $status)';
  }
}
