import 'dart:io';

import 'package:isar/isar.dart';
import 'package:isar/src/isar_connect_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../constant/keys.dart';
import '../environment/env.dart';
import '/core/database/local_value.dart';

final class Database {
  static final instance = Database._();

  static Isar? _isar;

  Database._();

  factory Database() => instance;

  Future<void> open(List<CollectionSchema<dynamic>> schemas) async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(schemas, directory: dir.path, inspector: false);
  }

  void deleteDatabase<T>() {
    _isar?.writeTxnSync(() {
      _isar?.clearSync();
    });
  }

  void deleteCollection<T>() {
    _isar?.writeTxnSync(() {
      _isar?.collection<T>().clearSync();
    });
  }

  Future<void> createBackUp() async {
    final backUpDir = await getApplicationSupportDirectory();

    final File backUpFile = File('${backUpDir.path}/backup_db.isar');
    if (await backUpFile.exists()) {
      await backUpFile.delete();
    }

    await _isar?.copyToFile('${backUpDir.path}/backup_db.isar');
  }

  Future<void> restoreDB() async {
    final dbDirectory = await getApplicationDocumentsDirectory();
    final backupDirectory = await getApplicationSupportDirectory();

    await _isar?.close();

    final dbFile = File('${backupDirectory.path}/backup_db.isar');
    final dbPath = p.join(dbDirectory.path, 'default.isar');

    if (await dbFile.exists()) {
      await dbFile.copy(dbPath);
    }
  }

  List<T> where<T>(
      QueryBuilder<T, T, QAfterWhereClause> Function(
              QueryBuilder<T, T, QWhere> where)
          func) {
    return func(_isar!.collection<T>().where()).findAllSync();
  }

  List<T> filter<T>(
      QueryBuilder<T, T, QAfterFilterCondition> Function(
              QueryBuilder<T, T, QFilterCondition> filter)
          func) {
    return func(_isar!.collection<T>().filter()).findAllSync();
  }

  T? getObject<T>({int? id}) {
    T? obj;
    if (id == null) {
      final listObj = _isar?.collection<T>().where().findAllSync();
      if (listObj != null && listObj.isNotEmpty) return listObj.last;
      return null;
    } else {
      obj = _isar?.collection<T>().getSync(id);
    }
    return obj;
  }

  List<T> getObjects<T>() {
    final objs = _isar!.collection<T>().where().findAllSync();

    return objs;
  }

  int? addObject<T>(T obj) {
    int? id;
    _isar?.writeTxnSync(() {
      id = _isar?.collection<T>().putSync(obj);
    });

    return id;
  }

  List<int>? addObjects<T>(List<T> objects) {
    List<int>? id;
    _isar?.writeTxnSync(() {
      id = _isar?.collection<T>().putAllSync(objects);
    });

    return id;
  }

  void deleteObject<T>({required int id}) {
    _isar?.writeTxnSync(() async {
      _isar?.collection<T>().deleteSync(id);
    });
  }

  /// get value by key
  String? getValue(String key) {
    final localValue =
        _isar?.localValues.filter().keyEqualTo(key).findFirstSync();

    return localValue?.value;
  }

  void setValue(String key, String? value) {
    final LocalValue? localValue =
        _isar?.localValues.filter().keyEqualTo(key).findFirstSync();
    if (localValue != null) {
      _isar?.writeTxnSync(() {
        _isar?.localValues.putSync(localValue..value = value);
      });
    } else {
      final object = LocalValue()
        ..key = key
        ..value = value;
      _isar?.writeTxnSync(() {
        _isar?.localValues.putSync(object);
      });
    }
  }

  List<Map<String, dynamic>> exportJson<T>() {
    final params = {
      'instance': env.variables[Keys.APP_NAME],
      'collection': _isar?.collection<T>().name,
      'filter': {'type': 0, 'filters': []}
    };

    final query = ConnectQuery.fromJson(params).toQuery();

    return query.exportJsonSync();
  }

  bool get isOpen => _isar != null;
}
