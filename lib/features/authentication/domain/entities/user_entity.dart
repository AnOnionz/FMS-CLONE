import 'dart:io';

import '../../data/models/user_model.dart';

base class UserEntity {
  final String idToken;
  final String accessToken;
  final String? refreshToken;
  final DateTime expiresAt;
  final List<String> scopes;
  final String tokenType;
  final String sub;

  String? email;

  DateTime? updatedAt;

  String? name;

  CustomUri? profileUrl;

  String? preferredUsername;

  String? gender;

  String? birthdate;

  String? zoneinfo;

  String? locale;

  String? phoneNumber;

  String? address;

  UserEntity({
    required this.idToken,
    required this.accessToken,
    required this.sub,
    this.scopes = const [],
    required this.tokenType,
    this.refreshToken,
    required this.expiresAt,
    this.name,
    this.preferredUsername,
    this.profileUrl,
    this.email,
    this.gender,
    this.birthdate,
    this.zoneinfo,
    this.locale,
    this.phoneNumber,
    this.address,
    this.updatedAt,
  });

  DateTime get realexpiresDate {
    if (Platform.isIOS) {
      return expiresAt.toLocal();
    } else {
      return DateTime.utc(expiresAt.year, expiresAt.month, expiresAt.day,
          expiresAt.hour, expiresAt.minute, expiresAt.second);
    }
  }

  @override
  String toString() {
    return 'UserEntity(refreshToken: $refreshToken, expiresAt: $expiresAt, scopes: $scopes, tokenType: $tokenType, sub: $sub, email: $email, updatedAt: $updatedAt, name: $name, profileUrl: $profileUrl, preferredUsername: $preferredUsername, gender: $gender, birthdate: $birthdate, zoneinfo: $zoneinfo, locale: $locale, phoneNumber: $phoneNumber, address: $address)';
  }
}
