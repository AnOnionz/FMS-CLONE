import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:fms/features/authentication/domain/entities/user_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';

part 'user_model.g.dart';

@collection
final class UserModel extends UserEntity {
  Id get isarId => fastHash(sub);

  UserModel({
    required super.idToken,
    required super.accessToken,
    required super.sub,
    required super.expiresAt,
    super.scopes,
    super.refreshToken,
    required super.tokenType,
    super.name,
    super.preferredUsername,
    super.profileUrl,
    super.email,
    super.gender,
    super.birthdate,
    super.zoneinfo,
    super.locale,
    super.phoneNumber,
    super.address,
    super.updatedAt,
  });

  factory UserModel.fromCredentials(Credentials credentials) {
    return UserModel(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
        expiresAt: credentials.expiresAt,
        scopes: credentials.scopes.toList(),
        refreshToken: credentials.refreshToken,
        tokenType: credentials.tokenType,
        sub: credentials.user.sub,
        name: credentials.user.name,
        preferredUsername: credentials.user.preferredUsername,
        address: jsonEncode(credentials.user.address),
        birthdate: credentials.user.birthdate,
        gender: credentials.user.gender,
        email: credentials.user.email,
        locale: credentials.user.locale,
        phoneNumber: credentials.user.phoneNumber,
        profileUrl: credentials.user.profileUrl != null
            ? CustomUri.fromUri(credentials.user.profileUrl)
            : null,
        updatedAt: credentials.user.updatedAt,
        zoneinfo: credentials.user.zoneinfo);
  }
}

@embedded
class CustomUri {
  String? scheme;
  String? userInfo;
  String? host;
  int? port;
  String? path;
  List<String>? pathSegments;
  String? query;
  String? queryParameters;
  String? fragment;

  CustomUri(
      {this.scheme,
      this.userInfo,
      this.host,
      this.port,
      this.path,
      this.pathSegments,
      this.query,
      this.queryParameters,
      this.fragment});

  factory CustomUri.fromUri(Uri? uri) {
    return CustomUri(
        fragment: uri?.fragment,
        host: uri?.host,
        path: uri?.path,
        pathSegments: uri?.pathSegments,
        port: uri?.port,
        query: uri?.query,
        queryParameters: uri?.queryParameters == null
            ? null
            : jsonEncode(uri?.queryParameters),
        scheme: uri?.scheme,
        userInfo: uri?.userInfo);
  }

  Uri toUri() {
    return Uri(
        fragment: fragment,
        host: host,
        path: path,
        pathSegments: pathSegments,
        port: port,
        query: query,
        queryParameters: queryParameters == null
            ? null
            : jsonDecode(queryParameters!) as Map<String, dynamic>?,
        scheme: scheme,
        userInfo: userInfo);
  }

  @override
  String toString() {
    return 'CustomUri(scheme: $scheme, userInfo: $userInfo, host: $host, port: $port, path: $path, pathSegments: $pathSegments, query: $query, queryParameters: $queryParameters, fragment: $fragment)';
  }
}
