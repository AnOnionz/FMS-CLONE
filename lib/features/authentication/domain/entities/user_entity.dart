import 'package:isar/isar.dart';

import '/core/utilities/parser.dart';

part 'user_entity.g.dart';

@collection
base class UserEntity {
  Id get isarId => fastHash(id);

  /// this is primary key
  final String id;

  const UserEntity({
    required this.id,
  });

  @override
  String toString() => 'UserEntity(id: $id)';
}

final class Anonymous extends UserEntity {
  Anonymous() : super(id: '0');
}
