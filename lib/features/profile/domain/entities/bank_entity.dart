import 'dart:convert';

class BankEntity {
  final int id;
  final String code;
  final String name;
  final String shortName;
  final String logo;

  BankEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.shortName,
    required this.logo,
  });

  BankEntity copyWith({
    int? id,
    String? code,
    String? name,
    String? shortName,
    String? logo,
  }) {
    return BankEntity(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'shortName': shortName,
      'logo': logo,
    };
  }

  factory BankEntity.fromMap(Map<String, dynamic> map) {
    return BankEntity(
      id: map['id'] as int,
      code: map['code'] as String,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      logo: map['logo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankEntity.fromJson(String source) =>
      BankEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BankEntity(id: $id, code: $code, name: $name, shortName: $shortName, logo: $logo)';
  }

  @override
  bool operator ==(covariant BankEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.code == code &&
        other.name == name &&
        other.shortName == shortName &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        name.hashCode ^
        shortName.hashCode ^
        logo.hashCode;
  }
}
