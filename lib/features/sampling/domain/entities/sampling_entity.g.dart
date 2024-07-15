// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sampling_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSamplingEntityCollection on Isar {
  IsarCollection<SamplingEntity> get samplingEntitys => this.collection();
}

const SamplingEntitySchema = CollectionSchema(
  name: r'SamplingEntity',
  id: 4912424377293578739,
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
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.long,
    ),
    r'keys': PropertySchema(
      id: 6,
      name: r'keys',
      type: IsarType.longList,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
      enumMap: _SamplingEntitystatusEnumValueMap,
    ),
    r'values': PropertySchema(
      id: 8,
      name: r'values',
      type: IsarType.objectList,
      target: r'SamplingValueEntity',
    )
  },
  estimateSize: _samplingEntityEstimateSize,
  serialize: _samplingEntitySerialize,
  deserialize: _samplingEntityDeserialize,
  deserializeProp: _samplingEntityDeserializeProp,
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
  embeddedSchemas: {r'SamplingValueEntity': SamplingValueEntitySchema},
  getId: _samplingEntityGetId,
  getLinks: _samplingEntityGetLinks,
  attach: _samplingEntityAttach,
  version: '3.1.0+1',
);

int _samplingEntityEstimateSize(
  SamplingEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dataUuid.length * 3;
  bytesCount += 3 + object.keys.length * 8;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.values.length * 3;
  {
    final offsets = allOffsets[SamplingValueEntity]!;
    for (var i = 0; i < object.values.length; i++) {
      final value = object.values[i];
      bytesCount +=
          SamplingValueEntitySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _samplingEntitySerialize(
  SamplingEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attendanceId);
  writer.writeDateTime(offsets[1], object.dataTimestamp);
  writer.writeString(offsets[2], object.dataUuid);
  writer.writeLong(offsets[3], object.featureId);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeLong(offsets[5], object.id);
  writer.writeLongList(offsets[6], object.keys);
  writer.writeString(offsets[7], object.status.name);
  writer.writeObjectList<SamplingValueEntity>(
    offsets[8],
    allOffsets,
    SamplingValueEntitySchema.serialize,
    object.values,
  );
}

SamplingEntity _samplingEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SamplingEntity(
    attendanceId: reader.readLongOrNull(offsets[0]),
    dataTimestamp: reader.readDateTime(offsets[1]),
    dataUuid: reader.readString(offsets[2]),
    featureId: reader.readLongOrNull(offsets[3]),
    id: reader.readLongOrNull(offsets[5]),
    status: _SamplingEntitystatusValueEnumMap[
            reader.readStringOrNull(offsets[7])] ??
        SyncStatus.isNoSynced,
    values: reader.readObjectList<SamplingValueEntity>(
          offsets[8],
          SamplingValueEntitySchema.deserialize,
          allOffsets,
          SamplingValueEntity(),
        ) ??
        [],
  );
  return object;
}

P _samplingEntityDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongList(offset) ?? []) as P;
    case 7:
      return (_SamplingEntitystatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.isNoSynced) as P;
    case 8:
      return (reader.readObjectList<SamplingValueEntity>(
            offset,
            SamplingValueEntitySchema.deserialize,
            allOffsets,
            SamplingValueEntity(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SamplingEntitystatusEnumValueMap = {
  r'synced': r'synced',
  r'isNoSynced': r'isNoSynced',
  r'isDeleted': r'isDeleted',
};
const _SamplingEntitystatusValueEnumMap = {
  r'synced': SyncStatus.synced,
  r'isNoSynced': SyncStatus.isNoSynced,
  r'isDeleted': SyncStatus.isDeleted,
};

Id _samplingEntityGetId(SamplingEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _samplingEntityGetLinks(SamplingEntity object) {
  return [];
}

void _samplingEntityAttach(
    IsarCollection<dynamic> col, Id id, SamplingEntity object) {}

extension SamplingEntityQueryWhereSort
    on QueryBuilder<SamplingEntity, SamplingEntity, QWhere> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhere> anyKeysElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'keys'),
      );
    });
  }
}

extension SamplingEntityQueryWhere
    on QueryBuilder<SamplingEntity, SamplingEntity, QWhereClause> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
      keysElementEqualTo(int keysElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'keys',
        value: [keysElement],
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterWhereClause>
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

extension SamplingEntityQueryFilter
    on QueryBuilder<SamplingEntity, SamplingEntity, QFilterCondition> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      attendanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      attendanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      attendanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      dataTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      dataUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      dataUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      dataUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      dataUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      keysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keys',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

extension SamplingEntityQueryObject
    on QueryBuilder<SamplingEntity, SamplingEntity, QFilterCondition> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      valuesElement(FilterQuery<SamplingValueEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'values');
    });
  }
}

extension SamplingEntityQueryLinks
    on QueryBuilder<SamplingEntity, SamplingEntity, QFilterCondition> {}

extension SamplingEntityQuerySortBy
    on QueryBuilder<SamplingEntity, SamplingEntity, QSortBy> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SamplingEntityQuerySortThenBy
    on QueryBuilder<SamplingEntity, SamplingEntity, QSortThenBy> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SamplingEntityQueryWhereDistinct
    on QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> {
  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct>
      distinctByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendanceId');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct>
      distinctByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTimestamp');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> distinctByDataUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct>
      distinctByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featureId');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> distinctByKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keys');
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension SamplingEntityQueryProperty
    on QueryBuilder<SamplingEntity, SamplingEntity, QQueryProperty> {
  QueryBuilder<SamplingEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SamplingEntity, int?, QQueryOperations> attendanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendanceId');
    });
  }

  QueryBuilder<SamplingEntity, DateTime, QQueryOperations>
      dataTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTimestamp');
    });
  }

  QueryBuilder<SamplingEntity, String, QQueryOperations> dataUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataUuid');
    });
  }

  QueryBuilder<SamplingEntity, int?, QQueryOperations> featureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featureId');
    });
  }

  QueryBuilder<SamplingEntity, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<SamplingEntity, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SamplingEntity, List<int>, QQueryOperations> keysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keys');
    });
  }

  QueryBuilder<SamplingEntity, SyncStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SamplingEntity, List<SamplingValueEntity>, QQueryOperations>
      valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }
}
