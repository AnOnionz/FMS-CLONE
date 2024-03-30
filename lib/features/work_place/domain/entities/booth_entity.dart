import 'dart:convert';

class BoothEntity {
  final int id;
  final bool isActive;
  final String name;
  final String? description;

  BoothEntity(this.id, this.isActive, this.name, this.description);

  BoothEntity copyWith({
    int? id,
    bool? isActive,
    String? name,
    String? description,
  }) {
    return BoothEntity(
      id ?? this.id,
      isActive ?? this.isActive,
      name ?? this.name,
      description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'name': name,
      'description': description,
    };
  }

  factory BoothEntity.fromMap(Map<String, dynamic> map) {
    return BoothEntity(
      map['id'] as int,
      map['isActive'] as bool,
      map['name'] as String,
      map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoothEntity.fromJson(String source) =>
      BoothEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoothEntity(id: $id, isActive: $isActive, name: $name, description: $description)';
  }
}
