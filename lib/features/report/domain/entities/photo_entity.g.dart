// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhotoEntityCollection on Isar {
  IsarCollection<PhotoEntity> get photoEntitys => this.collection();
}

const PhotoEntitySchema = CollectionSchema(
  name: r'PhotoEntity',
  id: 8245672414119462092,
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
    r'featurePhotoId': PropertySchema(
      id: 4,
      name: r'featurePhotoId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.long,
    ),
    r'image': PropertySchema(
      id: 6,
      name: r'image',
      type: IsarType.object,
      target: r'ImageCloud',
    ),
    r'path': PropertySchema(
      id: 7,
      name: r'path',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
      enumMap: _PhotoEntitystatusEnumValueMap,
    )
  },
  estimateSize: _photoEntityEstimateSize,
  serialize: _photoEntitySerialize,
  deserialize: _photoEntityDeserialize,
  deserializeProp: _photoEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'dataTimestamp': IndexSchema(
      id: 5857465224912740492,
      name: r'dataTimestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dataTimestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'ImageCloud': ImageCloudSchema},
  getId: _photoEntityGetId,
  getLinks: _photoEntityGetLinks,
  attach: _photoEntityAttach,
  version: '3.1.0+1',
);

int _photoEntityEstimateSize(
  PhotoEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dataUuid.length * 3;
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 +
          ImageCloudSchema.estimateSize(
              value, allOffsets[ImageCloud]!, allOffsets);
    }
  }
  {
    final value = object.path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _photoEntitySerialize(
  PhotoEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attendanceId);
  writer.writeDateTime(offsets[1], object.dataTimestamp);
  writer.writeString(offsets[2], object.dataUuid);
  writer.writeLong(offsets[3], object.featureId);
  writer.writeLong(offsets[4], object.featurePhotoId);
  writer.writeLong(offsets[5], object.id);
  writer.writeObject<ImageCloud>(
    offsets[6],
    allOffsets,
    ImageCloudSchema.serialize,
    object.image,
  );
  writer.writeString(offsets[7], object.path);
  writer.writeString(offsets[8], object.status.name);
}

PhotoEntity _photoEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhotoEntity(
    attendanceId: reader.readLongOrNull(offsets[0]),
    dataTimestamp: reader.readDateTime(offsets[1]),
    dataUuid: reader.readString(offsets[2]),
    featureId: reader.readLongOrNull(offsets[3]),
    featurePhotoId: reader.readLong(offsets[4]),
    id: reader.readLongOrNull(offsets[5]),
    image: reader.readObjectOrNull<ImageCloud>(
      offsets[6],
      ImageCloudSchema.deserialize,
      allOffsets,
    ),
    path: reader.readStringOrNull(offsets[7]),
    status:
        _PhotoEntitystatusValueEnumMap[reader.readStringOrNull(offsets[8])] ??
            SyncStatus.noSynced,
  );
  return object;
}

P _photoEntityDeserializeProp<P>(
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
      return (reader.readObjectOrNull<ImageCloud>(
        offset,
        ImageCloudSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_PhotoEntitystatusValueEnumMap[reader.readStringOrNull(offset)] ??
          SyncStatus.noSynced) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PhotoEntitystatusEnumValueMap = {
  r'noSynced': r'noSynced',
  r'synced': r'synced',
};
const _PhotoEntitystatusValueEnumMap = {
  r'noSynced': SyncStatus.noSynced,
  r'synced': SyncStatus.synced,
};

Id _photoEntityGetId(PhotoEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _photoEntityGetLinks(PhotoEntity object) {
  return [];
}

void _photoEntityAttach(
    IsarCollection<dynamic> col, Id id, PhotoEntity object) {}

extension PhotoEntityQueryWhereSort
    on QueryBuilder<PhotoEntity, PhotoEntity, QWhere> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhere> anyDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dataTimestamp'),
      );
    });
  }
}

extension PhotoEntityQueryWhere
    on QueryBuilder<PhotoEntity, PhotoEntity, QWhereClause> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause>
      dataTimestampEqualTo(DateTime dataTimestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dataTimestamp',
        value: [dataTimestamp],
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause>
      dataTimestampNotEqualTo(DateTime dataTimestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dataTimestamp',
              lower: [],
              upper: [dataTimestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dataTimestamp',
              lower: [dataTimestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dataTimestamp',
              lower: [dataTimestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dataTimestamp',
              lower: [],
              upper: [dataTimestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause>
      dataTimestampGreaterThan(
    DateTime dataTimestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dataTimestamp',
        lower: [dataTimestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause>
      dataTimestampLessThan(
    DateTime dataTimestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dataTimestamp',
        lower: [],
        upper: [dataTimestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterWhereClause>
      dataTimestampBetween(
    DateTime lowerDataTimestamp,
    DateTime upperDataTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dataTimestamp',
        lower: [lowerDataTimestamp],
        includeLower: includeLower,
        upper: [upperDataTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PhotoEntityQueryFilter
    on QueryBuilder<PhotoEntity, PhotoEntity, QFilterCondition> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      attendanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      attendanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      attendanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      dataTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> dataUuidEqualTo(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> dataUuidBetween(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      dataUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> dataUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      dataUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      dataUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featureIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featureIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featureIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featurePhotoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featurePhotoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featurePhotoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featurePhotoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featurePhotoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featurePhotoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      featurePhotoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featurePhotoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension PhotoEntityQueryObject
    on QueryBuilder<PhotoEntity, PhotoEntity, QFilterCondition> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterFilterCondition> image(
      FilterQuery<ImageCloud> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

extension PhotoEntityQueryLinks
    on QueryBuilder<PhotoEntity, PhotoEntity, QFilterCondition> {}

extension PhotoEntityQuerySortBy
    on QueryBuilder<PhotoEntity, PhotoEntity, QSortBy> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      sortByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      sortByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByFeaturePhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featurePhotoId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      sortByFeaturePhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featurePhotoId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PhotoEntityQuerySortThenBy
    on QueryBuilder<PhotoEntity, PhotoEntity, QSortThenBy> {
  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      thenByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      thenByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByFeaturePhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featurePhotoId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy>
      thenByFeaturePhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featurePhotoId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PhotoEntityQueryWhereDistinct
    on QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> {
  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendanceId');
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTimestamp');
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByDataUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featureId');
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByFeaturePhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featurePhotoId');
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoEntity, PhotoEntity, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension PhotoEntityQueryProperty
    on QueryBuilder<PhotoEntity, PhotoEntity, QQueryProperty> {
  QueryBuilder<PhotoEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PhotoEntity, int?, QQueryOperations> attendanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendanceId');
    });
  }

  QueryBuilder<PhotoEntity, DateTime, QQueryOperations>
      dataTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTimestamp');
    });
  }

  QueryBuilder<PhotoEntity, String, QQueryOperations> dataUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataUuid');
    });
  }

  QueryBuilder<PhotoEntity, int?, QQueryOperations> featureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featureId');
    });
  }

  QueryBuilder<PhotoEntity, int, QQueryOperations> featurePhotoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featurePhotoId');
    });
  }

  QueryBuilder<PhotoEntity, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhotoEntity, ImageCloud?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<PhotoEntity, String?, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<PhotoEntity, SyncStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
