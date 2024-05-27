import 'dart:convert';

import 'package:isar/isar.dart';

part 'employee_entity.g.dart';

class EmployeeEntity {
  final int id;
  final EmployeeUserEntity user;

  EmployeeEntity({
    required this.id,
    required this.user,
  });

  EmployeeEntity copyWith({
    int? id,
    EmployeeUserEntity? user,
  }) {
    return EmployeeEntity(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
    };
  }

  factory EmployeeEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeEntity(
      id: map['id'] as int,
      user: EmployeeUserEntity.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeEntity.fromJson(String source) =>
      EmployeeEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EmployeeEntity(id: $id, user: $user)';
}

@embedded
class EmployeeUserEntity {
  final int? id;
  final String? name;
  final String? username;
  final String? picture;
  final String? email;
  final String? phone;
  final String? gender;
  EmployeeUserEntity({
    this.id,
    this.name,
    this.username,
    this.picture,
    this.email,
    this.phone,
    this.gender,
  });

  EmployeeUserEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? picture,
    String? email,
    String? phone,
    String? gender,
  }) {
    return EmployeeUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      picture: picture ?? this.picture,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'picture': picture,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }

  factory EmployeeUserEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeUserEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      picture: map['picture'] as String?,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      gender: map['gender'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeUserEntity.fromJson(String source) =>
      EmployeeUserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeUserEntity(id: $id, name: $name, username: $username, picture: $picture, email: $email, phone: $phone, gender: $gender)';
  }
}
