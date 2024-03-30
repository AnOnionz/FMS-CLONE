// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OutletEntity {
  final int id;
  final bool isActive;
  final String code;
  final String name;

  OutletEntity(this.id, this.isActive, this.name, this.code);

  OutletEntity copyWith({
    int? id,
    bool? isActive,
    String? code,
    String? name,
  }) {
    return OutletEntity(
      id ?? this.id,
      isActive ?? this.isActive,
      code ?? this.code,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'code': code,
      'name': name,
    };
  }

  factory OutletEntity.fromMap(Map<String, dynamic> map) {
    return OutletEntity(
      map['id'] as int,
      map['isActive'] as bool,
      map['code'] as String,
      map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OutletEntity.fromJson(String source) =>
      OutletEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OutletEntity(id: $id, isActive: $isActive, code: $code, name: $name)';
  }
}
