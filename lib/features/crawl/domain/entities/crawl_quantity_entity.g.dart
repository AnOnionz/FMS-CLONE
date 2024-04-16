// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crawl_quantity_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrwalQuantityEntityCollection on Isar {
  IsarCollection<CrwalQuantityEntity> get crwalQuantityEntitys =>
      this.collection();
}

const CrwalQuantityEntitySchema = CollectionSchema(
  name: r'CrwalQuantityEntity',
  id: 5607932315756975443,
  properties: {
    r'createdTime': PropertySchema(
      id: 0,
      name: r'createdTime',
      type: IsarType.dateTime,
    ),
    r'dataTimestamp': PropertySchema(
      id: 1,
      name: r'dataTimestamp',
      type: IsarType.dateTime,
    ),
    r'dataUuid': PropertySchema(
      id: 2,
      name: r'dataUuid',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.string,
      enumMap: _CrwalQuantityEntitystatusEnumValueMap,
    ),
    r'values': PropertySchema(
      id: 5,
      name: r'values',
      type: IsarType.objectList,
      target: r'CrwaQuantitylValueEntity',
    )
  },
  estimateSize: _crwalQuantityEntityEstimateSize,
  serialize: _crwalQuantityEntitySerialize,
  deserialize: _crwalQuantityEntityDeserialize,
  deserializeProp: _crwalQuantityEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'CrwaQuantitylValueEntity': CrwaQuantitylValueEntitySchema
  },
  getId: _crwalQuantityEntityGetId,
  getLinks: _crwalQuantityEntityGetLinks,
  attach: _crwalQuantityEntityAttach,
  version: '3.1.0+1',
);

int _crwalQuantityEntityEstimateSize(
  CrwalQuantityEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dataUuid.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.values.length * 3;
  {
    final offsets = allOffsets[CrwaQuantitylValueEntity]!;
    for (var i = 0; i < object.values.length; i++) {
      final value = object.values[i];
      bytesCount += CrwaQuantitylValueEntitySchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _crwalQuantityEntitySerialize(
  CrwalQuantityEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdTime);
  writer.writeDateTime(offsets[1], object.dataTimestamp);
  writer.writeString(offsets[2], object.dataUuid);
  writer.writeLong(offsets[3], object.id);
  writer.writeString(offsets[4], object.status.name);
  writer.writeObjectList<CrwaQuantitylValueEntity>(
    offsets[5],
    allOffsets,
    CrwaQuantitylValueEntitySchema.serialize,
    object.values,
  );
}

CrwalQuantityEntity _crwalQuantityEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrwalQuantityEntity(
    createdTime: reader.readDateTime(offsets[0]),
    dataTimestamp: reader.readDateTime(offsets[1]),
    dataUuid: reader.readString(offsets[2]),
    id: reader.readLongOrNull(offsets[3]),
    status: _CrwalQuantityEntitystatusValueEnumMap[
            reader.readStringOrNull(offsets[4])] ??
        SyncStatus.noSynced,
    values: reader.readObjectList<CrwaQuantitylValueEntity>(
          offsets[5],
          CrwaQuantitylValueEntitySchema.deserialize,
          allOffsets,
          CrwaQuantitylValueEntity(),
        ) ??
        [],
  );
  return object;
}

P _crwalQuantityEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_CrwalQuantityEntitystatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.noSynced) as P;
    case 5:
      return (reader.readObjectList<CrwaQuantitylValueEntity>(
            offset,
            CrwaQuantitylValueEntitySchema.deserialize,
            allOffsets,
            CrwaQuantitylValueEntity(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CrwalQuantityEntitystatusEnumValueMap = {
  r'noSynced': r'noSynced',
  r'synced': r'synced',
};
const _CrwalQuantityEntitystatusValueEnumMap = {
  r'noSynced': SyncStatus.noSynced,
  r'synced': SyncStatus.synced,
};

Id _crwalQuantityEntityGetId(CrwalQuantityEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _crwalQuantityEntityGetLinks(
    CrwalQuantityEntity object) {
  return [];
}

void _crwalQuantityEntityAttach(
    IsarCollection<dynamic> col, Id id, CrwalQuantityEntity object) {}

extension CrwalQuantityEntityQueryWhereSort
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QWhere> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CrwalQuantityEntityQueryWhere
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QWhereClause> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CrwalQuantityEntityQueryFilter on QueryBuilder<CrwalQuantityEntity,
    CrwalQuantityEntity, QFilterCondition> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      createdTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      createdTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      createdTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      createdTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataTimestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataTimestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataTimestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      dataUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idLessThan(
    int? value, {
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

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusEqualTo(
    SyncStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusGreaterThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusLessThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CrwalQuantityEntityQueryObject on QueryBuilder<CrwalQuantityEntity,
    CrwalQuantityEntity, QFilterCondition> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterFilterCondition>
      valuesElement(FilterQuery<CrwaQuantitylValueEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'values');
    });
  }
}

extension CrwalQuantityEntityQueryLinks on QueryBuilder<CrwalQuantityEntity,
    CrwalQuantityEntity, QFilterCondition> {}

extension CrwalQuantityEntityQuerySortBy
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QSortBy> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CrwalQuantityEntityQuerySortThenBy
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QSortThenBy> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CrwalQuantityEntityQueryWhereDistinct
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct> {
  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct>
      distinctByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdTime');
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct>
      distinctByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTimestamp');
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct>
      distinctByDataUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct>
      distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension CrwalQuantityEntityQueryProperty
    on QueryBuilder<CrwalQuantityEntity, CrwalQuantityEntity, QQueryProperty> {
  QueryBuilder<CrwalQuantityEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CrwalQuantityEntity, DateTime, QQueryOperations>
      createdTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdTime');
    });
  }

  QueryBuilder<CrwalQuantityEntity, DateTime, QQueryOperations>
      dataTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTimestamp');
    });
  }

  QueryBuilder<CrwalQuantityEntity, String, QQueryOperations>
      dataUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataUuid');
    });
  }

  QueryBuilder<CrwalQuantityEntity, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CrwalQuantityEntity, SyncStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<CrwalQuantityEntity, List<CrwaQuantitylValueEntity>,
      QQueryOperations> valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CrwaQuantitylValueEntitySchema = Schema(
  name: r'CrwaQuantitylValueEntity',
  id: -6737740944530360459,
  properties: {
    r'featureQuantityId': PropertySchema(
      id: 0,
      name: r'featureQuantityId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.long,
    )
  },
  estimateSize: _crwaQuantitylValueEntityEstimateSize,
  serialize: _crwaQuantitylValueEntitySerialize,
  deserialize: _crwaQuantitylValueEntityDeserialize,
  deserializeProp: _crwaQuantitylValueEntityDeserializeProp,
);

int _crwaQuantitylValueEntityEstimateSize(
  CrwaQuantitylValueEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _crwaQuantitylValueEntitySerialize(
  CrwaQuantitylValueEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureQuantityId);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.value);
}

CrwaQuantitylValueEntity _crwaQuantitylValueEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrwaQuantitylValueEntity(
    featureQuantityId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    value: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _crwaQuantitylValueEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CrwaQuantitylValueEntityQueryFilter on QueryBuilder<
    CrwaQuantitylValueEntity, CrwaQuantitylValueEntity, QFilterCondition> {
  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureQuantityId',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureQuantityId',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureQuantityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureQuantityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureQuantityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureQuantityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<CrwaQuantitylValueEntity, CrwaQuantitylValueEntity,
      QAfterFilterCondition> valueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CrwaQuantitylValueEntityQueryObject on QueryBuilder<
    CrwaQuantitylValueEntity, CrwaQuantitylValueEntity, QFilterCondition> {}
