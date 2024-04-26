// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crawl_quantity_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrawlQuantityEntityCollection on Isar {
  IsarCollection<CrawlQuantityEntity> get crawlQuantityEntitys =>
      this.collection();
}

const CrawlQuantityEntitySchema = CollectionSchema(
  name: r'CrawlQuantityEntity',
  id: 4513806367770409850,
  properties: {
    r'attendanceId': PropertySchema(
      id: 0,
      name: r'attendanceId',
      type: IsarType.long,
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
    r'featureId': PropertySchema(
      id: 3,
      name: r'featureId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.long,
    ),
    r'keys': PropertySchema(
      id: 5,
      name: r'keys',
      type: IsarType.longList,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.string,
      enumMap: _CrawlQuantityEntitystatusEnumValueMap,
    ),
    r'values': PropertySchema(
      id: 7,
      name: r'values',
      type: IsarType.objectList,
      target: r'CrawlQuantitylValueEntity',
    )
  },
  estimateSize: _crawlQuantityEntityEstimateSize,
  serialize: _crawlQuantityEntitySerialize,
  deserialize: _crawlQuantityEntityDeserialize,
  deserializeProp: _crawlQuantityEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'keys': IndexSchema(
      id: 8738211483898358843,
      name: r'keys',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'keys',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'CrawlQuantitylValueEntity': CrawlQuantitylValueEntitySchema
  },
  getId: _crawlQuantityEntityGetId,
  getLinks: _crawlQuantityEntityGetLinks,
  attach: _crawlQuantityEntityAttach,
  version: '3.1.0+1',
);

int _crawlQuantityEntityEstimateSize(
  CrawlQuantityEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dataUuid.length * 3;
  bytesCount += 3 + object.keys.length * 8;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.values.length * 3;
  {
    final offsets = allOffsets[CrawlQuantitylValueEntity]!;
    for (var i = 0; i < object.values.length; i++) {
      final value = object.values[i];
      bytesCount += CrawlQuantitylValueEntitySchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _crawlQuantityEntitySerialize(
  CrawlQuantityEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attendanceId);
  writer.writeDateTime(offsets[1], object.dataTimestamp);
  writer.writeString(offsets[2], object.dataUuid);
  writer.writeLong(offsets[3], object.featureId);
  writer.writeLong(offsets[4], object.id);
  writer.writeLongList(offsets[5], object.keys);
  writer.writeString(offsets[6], object.status.name);
  writer.writeObjectList<CrawlQuantitylValueEntity>(
    offsets[7],
    allOffsets,
    CrawlQuantitylValueEntitySchema.serialize,
    object.values,
  );
}

CrawlQuantityEntity _crawlQuantityEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrawlQuantityEntity(
    attendanceId: reader.readLongOrNull(offsets[0]),
    dataTimestamp: reader.readDateTime(offsets[1]),
    dataUuid: reader.readString(offsets[2]),
    featureId: reader.readLongOrNull(offsets[3]),
    id: reader.readLongOrNull(offsets[4]),
    status: _CrawlQuantityEntitystatusValueEnumMap[
            reader.readStringOrNull(offsets[6])] ??
        SyncStatus.isNoSynced,
    values: reader.readObjectList<CrawlQuantitylValueEntity>(
          offsets[7],
          CrawlQuantitylValueEntitySchema.deserialize,
          allOffsets,
          CrawlQuantitylValueEntity(),
        ) ??
        [],
  );
  return object;
}

P _crawlQuantityEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (_CrawlQuantityEntitystatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.isNoSynced) as P;
    case 7:
      return (reader.readObjectList<CrawlQuantitylValueEntity>(
            offset,
            CrawlQuantitylValueEntitySchema.deserialize,
            allOffsets,
            CrawlQuantitylValueEntity(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CrawlQuantityEntitystatusEnumValueMap = {
  r'synced': r'synced',
  r'isNoSynced': r'isNoSynced',
  r'isDeleted': r'isDeleted',
};
const _CrawlQuantityEntitystatusValueEnumMap = {
  r'synced': SyncStatus.synced,
  r'isNoSynced': SyncStatus.isNoSynced,
  r'isDeleted': SyncStatus.isDeleted,
};

Id _crawlQuantityEntityGetId(CrawlQuantityEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _crawlQuantityEntityGetLinks(
    CrawlQuantityEntity object) {
  return [];
}

void _crawlQuantityEntityAttach(
    IsarCollection<dynamic> col, Id id, CrawlQuantityEntity object) {}

extension CrawlQuantityEntityQueryWhereSort
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QWhere> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhere>
      anyKeysElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'keys'),
      );
    });
  }
}

extension CrawlQuantityEntityQueryWhere
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QWhereClause> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      keysElementEqualTo(int keysElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'keys',
        value: [keysElement],
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      keysElementNotEqualTo(int keysElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keys',
              lower: [],
              upper: [keysElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keys',
              lower: [keysElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keys',
              lower: [keysElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keys',
              lower: [],
              upper: [keysElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      keysElementGreaterThan(
    int keysElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'keys',
        lower: [keysElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      keysElementLessThan(
    int keysElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'keys',
        lower: [],
        upper: [keysElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterWhereClause>
      keysElementBetween(
    int lowerKeysElement,
    int upperKeysElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'keys',
        lower: [lowerKeysElement],
        includeLower: includeLower,
        upper: [upperKeysElement],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CrawlQuantityEntityQueryFilter on QueryBuilder<CrawlQuantityEntity,
    CrawlQuantityEntity, QFilterCondition> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      attendanceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attendanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      dataTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      dataUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      dataUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      dataUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      dataUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      featureIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keys',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keys',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keys',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keys',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      keysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
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

extension CrawlQuantityEntityQueryObject on QueryBuilder<CrawlQuantityEntity,
    CrawlQuantityEntity, QFilterCondition> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterFilterCondition>
      valuesElement(FilterQuery<CrawlQuantitylValueEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'values');
    });
  }
}

extension CrawlQuantityEntityQueryLinks on QueryBuilder<CrawlQuantityEntity,
    CrawlQuantityEntity, QFilterCondition> {}

extension CrawlQuantityEntityQuerySortBy
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QSortBy> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CrawlQuantityEntityQuerySortThenBy
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QSortThenBy> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CrawlQuantityEntityQueryWhereDistinct
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct> {
  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendanceId');
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTimestamp');
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByDataUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featureId');
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keys');
    });
  }

  QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension CrawlQuantityEntityQueryProperty
    on QueryBuilder<CrawlQuantityEntity, CrawlQuantityEntity, QQueryProperty> {
  QueryBuilder<CrawlQuantityEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CrawlQuantityEntity, int?, QQueryOperations>
      attendanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendanceId');
    });
  }

  QueryBuilder<CrawlQuantityEntity, DateTime, QQueryOperations>
      dataTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTimestamp');
    });
  }

  QueryBuilder<CrawlQuantityEntity, String, QQueryOperations>
      dataUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataUuid');
    });
  }

  QueryBuilder<CrawlQuantityEntity, int?, QQueryOperations>
      featureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featureId');
    });
  }

  QueryBuilder<CrawlQuantityEntity, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CrawlQuantityEntity, List<int>, QQueryOperations>
      keysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keys');
    });
  }

  QueryBuilder<CrawlQuantityEntity, SyncStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<CrawlQuantityEntity, List<CrawlQuantitylValueEntity>,
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

const CrawlQuantitylValueEntitySchema = Schema(
  name: r'CrawlQuantitylValueEntity',
  id: -5197794866870597439,
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
  estimateSize: _crawlQuantitylValueEntityEstimateSize,
  serialize: _crawlQuantitylValueEntitySerialize,
  deserialize: _crawlQuantitylValueEntityDeserialize,
  deserializeProp: _crawlQuantitylValueEntityDeserializeProp,
);

int _crawlQuantitylValueEntityEstimateSize(
  CrawlQuantitylValueEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _crawlQuantitylValueEntitySerialize(
  CrawlQuantitylValueEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureQuantityId);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.value);
}

CrawlQuantitylValueEntity _crawlQuantitylValueEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrawlQuantitylValueEntity(
    featureQuantityId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    value: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _crawlQuantitylValueEntityDeserializeProp<P>(
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

extension CrawlQuantitylValueEntityQueryFilter on QueryBuilder<
    CrawlQuantitylValueEntity, CrawlQuantitylValueEntity, QFilterCondition> {
  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureQuantityId',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureQuantityId',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> featureQuantityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureQuantityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
      QAfterFilterCondition> valueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

  QueryBuilder<CrawlQuantitylValueEntity, CrawlQuantitylValueEntity,
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

extension CrawlQuantitylValueEntityQueryObject on QueryBuilder<
    CrawlQuantitylValueEntity, CrawlQuantitylValueEntity, QFilterCondition> {}
