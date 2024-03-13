// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_app.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingAppCollection on Isar {
  IsarCollection<SettingApp> get settingApps => this.collection();
}

const SettingAppSchema = CollectionSchema(
  name: r'SettingApp',
  id: 5273813227460369236,
  properties: {
    r'cameraCustom': PropertySchema(
      id: 0,
      name: r'cameraCustom',
      type: IsarType.bool,
    )
  },
  estimateSize: _settingAppEstimateSize,
  serialize: _settingAppSerialize,
  deserialize: _settingAppDeserialize,
  deserializeProp: _settingAppDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingAppGetId,
  getLinks: _settingAppGetLinks,
  attach: _settingAppAttach,
  version: '3.1.0+1',
);

int _settingAppEstimateSize(
  SettingApp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _settingAppSerialize(
  SettingApp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.cameraCustom);
}

SettingApp _settingAppDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingApp(
    cameraCustom: reader.readBoolOrNull(offsets[0]) ?? false,
    id: id,
  );
  return object;
}

P _settingAppDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingAppGetId(SettingApp object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _settingAppGetLinks(SettingApp object) {
  return [];
}

void _settingAppAttach(IsarCollection<dynamic> col, Id id, SettingApp object) {
  object.id = id;
}

extension SettingAppQueryWhereSort
    on QueryBuilder<SettingApp, SettingApp, QWhere> {
  QueryBuilder<SettingApp, SettingApp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingAppQueryWhere
    on QueryBuilder<SettingApp, SettingApp, QWhereClause> {
  QueryBuilder<SettingApp, SettingApp, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingAppQueryFilter
    on QueryBuilder<SettingApp, SettingApp, QFilterCondition> {
  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition>
      cameraCustomEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cameraCustom',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingAppQueryObject
    on QueryBuilder<SettingApp, SettingApp, QFilterCondition> {}

extension SettingAppQueryLinks
    on QueryBuilder<SettingApp, SettingApp, QFilterCondition> {}

extension SettingAppQuerySortBy
    on QueryBuilder<SettingApp, SettingApp, QSortBy> {
  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> sortByCameraCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cameraCustom', Sort.asc);
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> sortByCameraCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cameraCustom', Sort.desc);
    });
  }
}

extension SettingAppQuerySortThenBy
    on QueryBuilder<SettingApp, SettingApp, QSortThenBy> {
  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> thenByCameraCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cameraCustom', Sort.asc);
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> thenByCameraCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cameraCustom', Sort.desc);
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingApp, SettingApp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SettingAppQueryWhereDistinct
    on QueryBuilder<SettingApp, SettingApp, QDistinct> {
  QueryBuilder<SettingApp, SettingApp, QDistinct> distinctByCameraCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cameraCustom');
    });
  }
}

extension SettingAppQueryProperty
    on QueryBuilder<SettingApp, SettingApp, QQueryProperty> {
  QueryBuilder<SettingApp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingApp, bool, QQueryOperations> cameraCustomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cameraCustom');
    });
  }
}
