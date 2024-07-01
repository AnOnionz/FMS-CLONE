import 'package:flutter/material.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';

class UserProfileInherited extends InheritedWidget {
  const UserProfileInherited({
    super.key,
    required this.entity,
    required super.child,
  });

  final UserProfileEntity entity;

  static UserProfileInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProfileInherited>();
  }

  static UserProfileInherited of(BuildContext context) {
    final UserProfileInherited? result = maybeOf(context);
    assert(result != null, 'No DataFeature found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserProfileInherited oldWidget) =>
      entity != oldWidget.entity;
}
