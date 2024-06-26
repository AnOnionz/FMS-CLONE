// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fms/core/utilities/parser.dart';
import 'package:isar/isar.dart';

part 'employee_entity.g.dart';

@collection
class EmployeeEntity {
  Id get isarId => fastHash(id.toString());
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
  final bool? isFaceVerified;
  final bool? isProfileVerified;
  final bool? hasPendingProfile;
  EmployeeUserEntity({
    this.id,
    this.name,
    this.username,
    this.picture,
    this.email,
    this.phone,
    this.gender,
    this.isFaceVerified,
    this.isProfileVerified,
    this.hasPendingProfile,
  });

  EmployeeUserEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? picture,
    String? email,
    String? phone,
    String? gender,
    bool? isFaceVerified,
    bool? isProfileVerified,
    bool? hasPendingProfile,
  }) {
    return EmployeeUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      picture: picture ?? this.picture,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      isFaceVerified: isFaceVerified ?? this.isFaceVerified,
      isProfileVerified: isProfileVerified ?? this.isProfileVerified,
      hasPendingProfile: hasPendingProfile ?? this.hasPendingProfile,
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
      'isFaceVerified': isFaceVerified,
      'isProfileVerified': isProfileVerified,
      'hasPendingProfile': hasPendingProfile,
    };
  }

  factory EmployeeUserEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeUserEntity(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      isFaceVerified:
          map['isFaceVerified'] != null ? map['isFaceVerified'] as bool : null,
      isProfileVerified: map['isProfileVerified'] != null
          ? map['isProfileVerified'] as bool
          : null,
      hasPendingProfile: map['hasPendingProfile'] != null
          ? map['hasPendingProfile'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeUserEntity.fromJson(String source) =>
      EmployeeUserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeUserEntity(id: $id, name: $name, username: $username, picture: $picture, email: $email, phone: $phone, gender: $gender, isFaceVerified: $isFaceVerified, isProfileVerified: $isProfileVerified, hasPendingProfile: $hasPendingProfile)';
  }
}
