import 'package:isar/isar.dart';
import 'package:isar/src/isar_connect_api.dart';
import 'package:path_provider/path_provider.dart';
import '../constant/keys.dart';
import '/core/database/local_value.dart';
import '/core/environment/config.dart';

final class Database {
  static final instance = Database._();
  static Isar? isar;

  Database._();

  factory Database() => instance;

  static Future<void> open(List<CollectionSchema<dynamic>> schemas) async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(schemas,
        directory: dir.path, name: AppConfig.variables[Keys.APP_NAME]!);
  }

  void deleteDatabase<T>() {
    isar?.writeTxnSync(() {
      isar?.clearSync();
    });
  }

  void deleteCollection<T>() {
    isar?.writeTxnSync(() {
      isar?.collection<T>().clearSync();
    });
  }

  List<T> where<T>(
      QueryBuilder<T, T, QAfterWhereClause> Function(
              QueryBuilder<T, T, QWhere> where)
          func) {
    return func(isar!.collection<T>().where()).findAllSync();
  }

  List<T> filter<T>(
      QueryBuilder<T, T, QAfterFilterCondition> Function(
              QueryBuilder<T, T, QFilterCondition> filter)
          func) {
    return func(isar!.collection<T>().filter()).findAllSync();
  }

  T? getObject<T>({int? id}) {
    T? obj;
    if (id == null) {
      obj = isar?.collection<T>().where().findAllSync().last;
    } else {
      obj = isar?.collection<T>().getSync(id);
    }
    return obj;
  }

  List<T> getObjects<T>() {
    final objs = isar!.collection<T>().where().findAllSync();

    return objs;
  }

  int? addObject<T>(T obj) {
    int? id;
    isar?.writeTxnSync(() {
      id = isar?.collection<T>().putSync(obj);
    });

    return id;
  }

  List<int>? addObjects<T>(List<T> objects) {
    List<int>? id;
    isar?.writeTxnSync(() {
      id = isar?.collection<T>().putAllSync(objects);
    });

    return id;
  }

  void deleteObject<T>({required int id}) {
    isar?.writeTxnSync(() async {
      isar?.collection<T>().deleteSync(id);
    });
  }

  /// get value by key
  String? getValue(String key) {
    final localValue =
        isar?.localValues.filter().keyEqualTo(key).findFirstSync();

    return localValue?.value;
  }

  void setValue(String key, String? value) {
    final LocalValue? localValue =
        isar?.localValues.filter().keyEqualTo(key).findFirstSync();
    if (localValue != null) {
      isar?.writeTxnSync(() {
        isar?.localValues.putSync(localValue..value = value);
      });
    } else {
      final object = LocalValue()
        ..key = key
        ..value = value;
      isar?.writeTxnSync(() {
        isar?.localValues.putSync(object);
      });
    }
  }

  List<Map<String, dynamic>> exportJson<T>() {
    final params = {
      'instance': AppConfig.variables[Keys.APP_NAME],
      'collection': isar?.collection<T>().name,
      'filter': {'type': 0, 'filters': []}
    };

    final query = ConnectQuery.fromJson(params).toQuery();

    return query.exportJsonSync();
  }

  bool get isOpen => isar != null;
}
