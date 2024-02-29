// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'local_value.g.dart';

@collection
class LocalValue {
  Id? id;
  @Index(unique: true)
  late String key;
  String? value;

  @override
  String toString() => 'LocalValue(key: $key, value: $value)';
}
