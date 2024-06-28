import 'dart:convert';

import 'package:fms/core/constant/enum.dart';

class ProfileStatusEntity {
  final int id;
  final bool read;
  final ProfileStatus status;
  final String? reason;

  ProfileStatusEntity(
      {required this.id,
      required this.read,
      required this.status,
      required this.reason});

  ProfileStatusEntity copyWith({
    int? id,
    bool? read,
    ProfileStatus? status,
    String? reason,
  }) {
    return ProfileStatusEntity(
      id: id ?? this.id,
      read: read ?? this.read,
      status: status ?? this.status,
      reason: reason ?? this.reason,
    );
  }

  factory ProfileStatusEntity.fromMap(Map<String, dynamic> map) {
    return ProfileStatusEntity(
      id: map['id'] as int,
      read: map['read'] as bool,
      status: ProfileStatus.values
          .firstWhere((element) => element.name == map['status']),
      reason: map['reason'] as String?,
    );
  }

  factory ProfileStatusEntity.fromJson(String source) =>
      ProfileStatusEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileStatusEnity(id: $id, read: $read, status: $status, reason: $reason)';
  }
}
