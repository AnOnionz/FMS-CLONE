// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ConfigEntitySchema = Schema(
  name: r'ConfigEntity',
  id: -8265977475513355478,
  properties: {
    r'features': PropertySchema(
      id: 0,
      name: r'features',
      type: IsarType.objectList,
      target: r'FeatureEntity',
    ),
    r'versionCode': PropertySchema(
      id: 1,
      name: r'versionCode',
      type: IsarType.string,
    ),
    r'versionId': PropertySchema(
      id: 2,
      name: r'versionId',
      type: IsarType.long,
    )
  },
  estimateSize: _configEntityEstimateSize,
  serialize: _configEntitySerialize,
  deserialize: _configEntityDeserialize,
  deserializeProp: _configEntityDeserializeProp,
);

int _configEntityEstimateSize(
  ConfigEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.features;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.versionCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _configEntitySerialize(
  ConfigEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FeatureEntity>(
    offsets[0],
    allOffsets,
    FeatureEntitySchema.serialize,
    object.features,
  );
  writer.writeString(offsets[1], object.versionCode);
  writer.writeLong(offsets[2], object.versionId);
}

ConfigEntity _configEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ConfigEntity(
    features: reader.readObjectList<FeatureEntity>(
      offsets[0],
      FeatureEntitySchema.deserialize,
      allOffsets,
      FeatureEntity(),
    ),
    versionCode: reader.readStringOrNull(offsets[1]),
    versionId: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _configEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FeatureEntity>(
        offset,
        FeatureEntitySchema.deserialize,
        allOffsets,
        FeatureEntity(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ConfigEntityQueryFilter
    on QueryBuilder<ConfigEntity, ConfigEntity, QFilterCondition> {
  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'features',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'features',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'features',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionCode',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionCode',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'versionCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'versionCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'versionCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'versionCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionId',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionId',
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'versionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'versionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      versionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'versionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigEntityQueryObject
    on QueryBuilder<ConfigEntity, ConfigEntity, QFilterCondition> {
  QueryBuilder<ConfigEntity, ConfigEntity, QAfterFilterCondition>
      featuresElement(FilterQuery<FeatureEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'features');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureEntitySchema = Schema(
  name: r'FeatureEntity',
  id: 4765887835421641802,
  properties: {
    r'dependentOnFeatureIds': PropertySchema(
      id: 0,
      name: r'dependentOnFeatureIds',
      type: IsarType.longList,
    ),
    r'featureAttendance': PropertySchema(
      id: 1,
      name: r'featureAttendance',
      type: IsarType.object,
      target: r'FeatureAttendance',
    ),
    r'featureCustomers': PropertySchema(
      id: 2,
      name: r'featureCustomers',
      type: IsarType.objectList,
      target: r'FeatureCustomer',
    ),
    r'featureMultimedias': PropertySchema(
      id: 3,
      name: r'featureMultimedias',
      type: IsarType.objectList,
      target: r'FeatureMultimedia',
    ),
    r'featureOrder': PropertySchema(
      id: 4,
      name: r'featureOrder',
      type: IsarType.object,
      target: r'FeatureOrder',
    ),
    r'featurePhotos': PropertySchema(
      id: 5,
      name: r'featurePhotos',
      type: IsarType.objectList,
      target: r'FeaturePhoto',
    ),
    r'featureQuantities': PropertySchema(
      id: 6,
      name: r'featureQuantities',
      type: IsarType.objectList,
      target: r'FeatureQuantity',
    ),
    r'featureSamplings': PropertySchema(
      id: 7,
      name: r'featureSamplings',
      type: IsarType.objectList,
      target: r'FeatureSampling',
    ),
    r'featureSchemes': PropertySchema(
      id: 8,
      name: r'featureSchemes',
      type: IsarType.objectList,
      target: r'FeatureScheme',
    ),
    r'id': PropertySchema(
      id: 9,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'ordinal': PropertySchema(
      id: 11,
      name: r'ordinal',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.string,
      enumMap: _FeatureEntitytypeEnumValueMap,
    )
  },
  estimateSize: _featureEntityEstimateSize,
  serialize: _featureEntitySerialize,
  deserialize: _featureEntityDeserialize,
  deserializeProp: _featureEntityDeserializeProp,
);

int _featureEntityEstimateSize(
  FeatureEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dependentOnFeatureIds;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.featureAttendance;
    if (value != null) {
      bytesCount += 3 +
          FeatureAttendanceSchema.estimateSize(
              value, allOffsets[FeatureAttendance]!, allOffsets);
    }
  }
  {
    final list = object.featureCustomers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureCustomer]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureCustomerSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.featureMultimedias;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureMultimedia]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureMultimediaSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.featureOrder;
    if (value != null) {
      bytesCount += 3 +
          FeatureOrderSchema.estimateSize(
              value, allOffsets[FeatureOrder]!, allOffsets);
    }
  }
  {
    final list = object.featurePhotos;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeaturePhoto]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeaturePhotoSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.featureQuantities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureQuantity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureQuantitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.featureSamplings;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureSampling]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureSamplingSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.featureSchemes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FeatureScheme]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FeatureSchemeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _featureEntitySerialize(
  FeatureEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.dependentOnFeatureIds);
  writer.writeObject<FeatureAttendance>(
    offsets[1],
    allOffsets,
    FeatureAttendanceSchema.serialize,
    object.featureAttendance,
  );
  writer.writeObjectList<FeatureCustomer>(
    offsets[2],
    allOffsets,
    FeatureCustomerSchema.serialize,
    object.featureCustomers,
  );
  writer.writeObjectList<FeatureMultimedia>(
    offsets[3],
    allOffsets,
    FeatureMultimediaSchema.serialize,
    object.featureMultimedias,
  );
  writer.writeObject<FeatureOrder>(
    offsets[4],
    allOffsets,
    FeatureOrderSchema.serialize,
    object.featureOrder,
  );
  writer.writeObjectList<FeaturePhoto>(
    offsets[5],
    allOffsets,
    FeaturePhotoSchema.serialize,
    object.featurePhotos,
  );
  writer.writeObjectList<FeatureQuantity>(
    offsets[6],
    allOffsets,
    FeatureQuantitySchema.serialize,
    object.featureQuantities,
  );
  writer.writeObjectList<FeatureSampling>(
    offsets[7],
    allOffsets,
    FeatureSamplingSchema.serialize,
    object.featureSamplings,
  );
  writer.writeObjectList<FeatureScheme>(
    offsets[8],
    allOffsets,
    FeatureSchemeSchema.serialize,
    object.featureSchemes,
  );
  writer.writeLong(offsets[9], object.id);
  writer.writeString(offsets[10], object.name);
  writer.writeLong(offsets[11], object.ordinal);
  writer.writeString(offsets[12], object.type?.name);
}

FeatureEntity _featureEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureEntity(
    dependentOnFeatureIds: reader.readLongList(offsets[0]),
    featureAttendance: reader.readObjectOrNull<FeatureAttendance>(
      offsets[1],
      FeatureAttendanceSchema.deserialize,
      allOffsets,
    ),
    featureCustomers: reader.readObjectList<FeatureCustomer>(
      offsets[2],
      FeatureCustomerSchema.deserialize,
      allOffsets,
      FeatureCustomer(),
    ),
    featureMultimedias: reader.readObjectList<FeatureMultimedia>(
      offsets[3],
      FeatureMultimediaSchema.deserialize,
      allOffsets,
      FeatureMultimedia(),
    ),
    featureOrder: reader.readObjectOrNull<FeatureOrder>(
      offsets[4],
      FeatureOrderSchema.deserialize,
      allOffsets,
    ),
    featurePhotos: reader.readObjectList<FeaturePhoto>(
      offsets[5],
      FeaturePhotoSchema.deserialize,
      allOffsets,
      FeaturePhoto(),
    ),
    featureQuantities: reader.readObjectList<FeatureQuantity>(
      offsets[6],
      FeatureQuantitySchema.deserialize,
      allOffsets,
      FeatureQuantity(),
    ),
    featureSamplings: reader.readObjectList<FeatureSampling>(
      offsets[7],
      FeatureSamplingSchema.deserialize,
      allOffsets,
      FeatureSampling(),
    ),
    featureSchemes: reader.readObjectList<FeatureScheme>(
      offsets[8],
      FeatureSchemeSchema.deserialize,
      allOffsets,
      FeatureScheme(),
    ),
    id: reader.readLongOrNull(offsets[9]),
    name: reader.readStringOrNull(offsets[10]),
    ordinal: reader.readLongOrNull(offsets[11]),
    type: _FeatureEntitytypeValueEnumMap[reader.readStringOrNull(offsets[12])],
  );
  return object;
}

P _featureEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<FeatureAttendance>(
        offset,
        FeatureAttendanceSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectList<FeatureCustomer>(
        offset,
        FeatureCustomerSchema.deserialize,
        allOffsets,
        FeatureCustomer(),
      )) as P;
    case 3:
      return (reader.readObjectList<FeatureMultimedia>(
        offset,
        FeatureMultimediaSchema.deserialize,
        allOffsets,
        FeatureMultimedia(),
      )) as P;
    case 4:
      return (reader.readObjectOrNull<FeatureOrder>(
        offset,
        FeatureOrderSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectList<FeaturePhoto>(
        offset,
        FeaturePhotoSchema.deserialize,
        allOffsets,
        FeaturePhoto(),
      )) as P;
    case 6:
      return (reader.readObjectList<FeatureQuantity>(
        offset,
        FeatureQuantitySchema.deserialize,
        allOffsets,
        FeatureQuantity(),
      )) as P;
    case 7:
      return (reader.readObjectList<FeatureSampling>(
        offset,
        FeatureSamplingSchema.deserialize,
        allOffsets,
        FeatureSampling(),
      )) as P;
    case 8:
      return (reader.readObjectList<FeatureScheme>(
        offset,
        FeatureSchemeSchema.deserialize,
        allOffsets,
        FeatureScheme(),
      )) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (_FeatureEntitytypeValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FeatureEntitytypeEnumValueMap = {
  r'attendanceClockingIn': r'attendanceClockingIn',
  r'attendanceClockingOut': r'attendanceClockingOut',
  r'photography': r'photography',
  r'customerInformationCapturing': r'customerInformationCapturing',
  r'multiSubjectMultimediaInformationCapturing':
      r'multiSubjectMultimediaInformationCapturing',
  r'multipleEntitiesQuantityCapturing': r'multipleEntitiesQuantityCapturing',
  r'synchronization': r'synchronization',
  r'onlineIndividualSummaryReport': r'onlineIndividualSummaryReport',
  r'onlineTeamSummaryReport': r'onlineTeamSummaryReport',
  r'summaryReport': r'summaryReport',
};
const _FeatureEntitytypeValueEnumMap = {
  r'attendanceClockingIn': FeatureType.attendanceClockingIn,
  r'attendanceClockingOut': FeatureType.attendanceClockingOut,
  r'photography': FeatureType.photography,
  r'customerInformationCapturing': FeatureType.customerInformationCapturing,
  r'multiSubjectMultimediaInformationCapturing':
      FeatureType.multiSubjectMultimediaInformationCapturing,
  r'multipleEntitiesQuantityCapturing':
      FeatureType.multipleEntitiesQuantityCapturing,
  r'synchronization': FeatureType.synchronization,
  r'onlineIndividualSummaryReport': FeatureType.onlineIndividualSummaryReport,
  r'onlineTeamSummaryReport': FeatureType.onlineTeamSummaryReport,
  r'summaryReport': FeatureType.summaryReport,
};

extension FeatureEntityQueryFilter
    on QueryBuilder<FeatureEntity, FeatureEntity, QFilterCondition> {
  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dependentOnFeatureIds',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dependentOnFeatureIds',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dependentOnFeatureIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dependentOnFeatureIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dependentOnFeatureIds',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dependentOnFeatureIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      dependentOnFeatureIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dependentOnFeatureIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureAttendanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureAttendance',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureAttendanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureAttendance',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureCustomers',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureCustomers',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCustomers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureMultimedias',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureMultimedias',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureMultimedias',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureOrder',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureOrder',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featurePhotos',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featurePhotos',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featurePhotos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureQuantities',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureQuantities',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureQuantities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureSamplings',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureSamplings',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSamplings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureSchemes',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureSchemes',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureSchemes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
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

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> typeEqualTo(
    FeatureType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeGreaterThan(
    FeatureType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeLessThan(
    FeatureType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> typeBetween(
    FeatureType? lower,
    FeatureType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension FeatureEntityQueryObject
    on QueryBuilder<FeatureEntity, FeatureEntity, QFilterCondition> {
  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureAttendance(FilterQuery<FeatureAttendance> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureAttendance');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureCustomersElement(FilterQuery<FeatureCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureCustomers');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureMultimediasElement(FilterQuery<FeatureMultimedia> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureMultimedias');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureOrder(FilterQuery<FeatureOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureOrder');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featurePhotosElement(FilterQuery<FeaturePhoto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featurePhotos');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureQuantitiesElement(FilterQuery<FeatureQuantity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureQuantities');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSamplingsElement(FilterQuery<FeatureSampling> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureSamplings');
    });
  }

  QueryBuilder<FeatureEntity, FeatureEntity, QAfterFilterCondition>
      featureSchemesElement(FilterQuery<FeatureScheme> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureSchemes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureAttendanceSchema = Schema(
  name: r'FeatureAttendance',
  id: -2434800916097642624,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'isLocationRequired': PropertySchema(
      id: 1,
      name: r'isLocationRequired',
      type: IsarType.bool,
    ),
    r'isPhotoRequired': PropertySchema(
      id: 2,
      name: r'isPhotoRequired',
      type: IsarType.bool,
    ),
    r'isWatermarkRequired': PropertySchema(
      id: 3,
      name: r'isWatermarkRequired',
      type: IsarType.bool,
    ),
    r'mustWithinRadius': PropertySchema(
      id: 4,
      name: r'mustWithinRadius',
      type: IsarType.double,
    )
  },
  estimateSize: _featureAttendanceEstimateSize,
  serialize: _featureAttendanceSerialize,
  deserialize: _featureAttendanceDeserialize,
  deserializeProp: _featureAttendanceDeserializeProp,
);

int _featureAttendanceEstimateSize(
  FeatureAttendance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _featureAttendanceSerialize(
  FeatureAttendance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeBool(offsets[1], object.isLocationRequired);
  writer.writeBool(offsets[2], object.isPhotoRequired);
  writer.writeBool(offsets[3], object.isWatermarkRequired);
  writer.writeDouble(offsets[4], object.mustWithinRadius);
}

FeatureAttendance _featureAttendanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureAttendance(
    id: reader.readLongOrNull(offsets[0]),
    isLocationRequired: reader.readBoolOrNull(offsets[1]),
    isPhotoRequired: reader.readBoolOrNull(offsets[2]),
    isWatermarkRequired: reader.readBoolOrNull(offsets[3]),
    mustWithinRadius: reader.readDoubleOrNull(offsets[4]),
  );
  return object;
}

P _featureAttendanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureAttendanceQueryFilter
    on QueryBuilder<FeatureAttendance, FeatureAttendance, QFilterCondition> {
  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
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

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
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

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
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

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isLocationRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocationRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isLocationRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocationRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isLocationRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocationRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isPhotoRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isPhotoRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isPhotoRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isPhotoRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isPhotoRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPhotoRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isWatermarkRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isWatermarkRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      isWatermarkRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatermarkRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mustWithinRadius',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mustWithinRadius',
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mustWithinRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mustWithinRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mustWithinRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeatureAttendance, FeatureAttendance, QAfterFilterCondition>
      mustWithinRadiusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mustWithinRadius',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FeatureAttendanceQueryObject
    on QueryBuilder<FeatureAttendance, FeatureAttendance, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureQuantitySchema = Schema(
  name: r'FeatureQuantity',
  id: -4835096873751272641,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'item': PropertySchema(
      id: 1,
      name: r'item',
      type: IsarType.object,
      target: r'Item',
    ),
    r'ordinal': PropertySchema(
      id: 2,
      name: r'ordinal',
      type: IsarType.long,
    ),
    r'product': PropertySchema(
      id: 3,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 4,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    )
  },
  estimateSize: _featureQuantityEstimateSize,
  serialize: _featureQuantitySerialize,
  deserialize: _featureQuantityDeserialize,
  deserializeProp: _featureQuantityDeserializeProp,
);

int _featureQuantityEstimateSize(
  FeatureQuantity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.item;
    if (value != null) {
      bytesCount +=
          3 + ItemSchema.estimateSize(value, allOffsets[Item]!, allOffsets);
    }
  }
  {
    final value = object.product;
    if (value != null) {
      bytesCount += 3 +
          ProductSchema.estimateSize(value, allOffsets[Product]!, allOffsets);
    }
  }
  {
    final value = object.productPackaging;
    if (value != null) {
      bytesCount += 3 +
          ProductPackagingSchema.estimateSize(
              value, allOffsets[ProductPackaging]!, allOffsets);
    }
  }
  return bytesCount;
}

void _featureQuantitySerialize(
  FeatureQuantity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeObject<Item>(
    offsets[1],
    allOffsets,
    ItemSchema.serialize,
    object.item,
  );
  writer.writeLong(offsets[2], object.ordinal);
  writer.writeObject<Product>(
    offsets[3],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[4],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
}

FeatureQuantity _featureQuantityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureQuantity(
    id: reader.readLongOrNull(offsets[0]),
    item: reader.readObjectOrNull<Item>(
      offsets[1],
      ItemSchema.deserialize,
      allOffsets,
    ),
    ordinal: reader.readLongOrNull(offsets[2]),
    product: reader.readObjectOrNull<Product>(
      offsets[3],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[4],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _featureQuantityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Item>(
        offset,
        ItemSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureQuantityQueryFilter
    on QueryBuilder<FeatureQuantity, FeatureQuantity, QFilterCondition> {
  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
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

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
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

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
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

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }
}

extension FeatureQuantityQueryObject
    on QueryBuilder<FeatureQuantity, FeatureQuantity, QFilterCondition> {
  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition> item(
      FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<FeatureQuantity, FeatureQuantity, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeaturePhotoSchema = Schema(
  name: r'FeaturePhoto',
  id: -8878358104047948198,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'isRequired': PropertySchema(
      id: 2,
      name: r'isRequired',
      type: IsarType.bool,
    ),
    r'isWatermarkRequired': PropertySchema(
      id: 3,
      name: r'isWatermarkRequired',
      type: IsarType.bool,
    ),
    r'maximum': PropertySchema(
      id: 4,
      name: r'maximum',
      type: IsarType.long,
    ),
    r'minimum': PropertySchema(
      id: 5,
      name: r'minimum',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'ordinal': PropertySchema(
      id: 7,
      name: r'ordinal',
      type: IsarType.long,
    )
  },
  estimateSize: _featurePhotoEstimateSize,
  serialize: _featurePhotoSerialize,
  deserialize: _featurePhotoDeserialize,
  deserializeProp: _featurePhotoDeserializeProp,
);

int _featurePhotoEstimateSize(
  FeaturePhoto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _featurePhotoSerialize(
  FeaturePhoto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.id);
  writer.writeBool(offsets[2], object.isRequired);
  writer.writeBool(offsets[3], object.isWatermarkRequired);
  writer.writeLong(offsets[4], object.maximum);
  writer.writeLong(offsets[5], object.minimum);
  writer.writeString(offsets[6], object.name);
  writer.writeLong(offsets[7], object.ordinal);
}

FeaturePhoto _featurePhotoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeaturePhoto(
    description: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    isWatermarkRequired: reader.readBoolOrNull(offsets[3]),
    maximum: reader.readLongOrNull(offsets[4]),
    minimum: reader.readLongOrNull(offsets[5]),
    name: reader.readStringOrNull(offsets[6]),
    ordinal: reader.readLongOrNull(offsets[7]),
  );
  return object;
}

P _featurePhotoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeaturePhotoQueryFilter
    on QueryBuilder<FeaturePhoto, FeaturePhoto, QFilterCondition> {
  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      isRequiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      isWatermarkRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      isWatermarkRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      isWatermarkRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatermarkRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maximum',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maximum',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maximum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maximum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maximum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      maximumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maximum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimum',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimum',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimum',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      minimumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturePhoto, FeaturePhoto, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeaturePhotoQueryObject
    on QueryBuilder<FeaturePhoto, FeaturePhoto, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureMultimediaSchema = Schema(
  name: r'FeatureMultimedia',
  id: 960702206004898377,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'isTextFieldRequired': PropertySchema(
      id: 2,
      name: r'isTextFieldRequired',
      type: IsarType.bool,
    ),
    r'isWatermarkRequired': PropertySchema(
      id: 3,
      name: r'isWatermarkRequired',
      type: IsarType.bool,
    ),
    r'maximumImages': PropertySchema(
      id: 4,
      name: r'maximumImages',
      type: IsarType.long,
    ),
    r'minimumImages': PropertySchema(
      id: 5,
      name: r'minimumImages',
      type: IsarType.long,
    ),
    r'ordinal': PropertySchema(
      id: 6,
      name: r'ordinal',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _featureMultimediaEstimateSize,
  serialize: _featureMultimediaSerialize,
  deserialize: _featureMultimediaDeserialize,
  deserializeProp: _featureMultimediaDeserializeProp,
);

int _featureMultimediaEstimateSize(
  FeatureMultimedia object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _featureMultimediaSerialize(
  FeatureMultimedia object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.id);
  writer.writeBool(offsets[2], object.isTextFieldRequired);
  writer.writeBool(offsets[3], object.isWatermarkRequired);
  writer.writeLong(offsets[4], object.maximumImages);
  writer.writeLong(offsets[5], object.minimumImages);
  writer.writeLong(offsets[6], object.ordinal);
  writer.writeString(offsets[7], object.title);
}

FeatureMultimedia _featureMultimediaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureMultimedia(
    description: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    isTextFieldRequired: reader.readBoolOrNull(offsets[2]),
    isWatermarkRequired: reader.readBoolOrNull(offsets[3]),
    maximumImages: reader.readLongOrNull(offsets[4]),
    minimumImages: reader.readLongOrNull(offsets[5]),
    ordinal: reader.readLongOrNull(offsets[6]),
    title: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _featureMultimediaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureMultimediaQueryFilter
    on QueryBuilder<FeatureMultimedia, FeatureMultimedia, QFilterCondition> {
  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
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

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
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

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
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

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isTextFieldRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isTextFieldRequired',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isTextFieldRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isTextFieldRequired',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isTextFieldRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTextFieldRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isWatermarkRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isWatermarkRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isWatermarkRequired',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      isWatermarkRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatermarkRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maximumImages',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maximumImages',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maximumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maximumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maximumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      maximumImagesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maximumImages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimumImages',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimumImages',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumImages',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      minimumImagesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumImages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureMultimedia, FeatureMultimedia, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension FeatureMultimediaQueryObject
    on QueryBuilder<FeatureMultimedia, FeatureMultimedia, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureOrderSchema = Schema(
  name: r'FeatureOrder',
  id: 4690601502233192119,
  properties: {
    r'hasCustomer': PropertySchema(
      id: 0,
      name: r'hasCustomer',
      type: IsarType.bool,
    ),
    r'hasExchange': PropertySchema(
      id: 1,
      name: r'hasExchange',
      type: IsarType.bool,
    ),
    r'hasPhoto': PropertySchema(
      id: 2,
      name: r'hasPhoto',
      type: IsarType.bool,
    ),
    r'hasPurchase': PropertySchema(
      id: 3,
      name: r'hasPurchase',
      type: IsarType.bool,
    ),
    r'hasSampling': PropertySchema(
      id: 4,
      name: r'hasSampling',
      type: IsarType.bool,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.long,
    ),
    r'isCustomerRequired': PropertySchema(
      id: 6,
      name: r'isCustomerRequired',
      type: IsarType.bool,
    ),
    r'products': PropertySchema(
      id: 7,
      name: r'products',
      type: IsarType.objectList,
      target: r'OrderProduct',
    )
  },
  estimateSize: _featureOrderEstimateSize,
  serialize: _featureOrderSerialize,
  deserialize: _featureOrderDeserialize,
  deserializeProp: _featureOrderDeserializeProp,
);

int _featureOrderEstimateSize(
  FeatureOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.products;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[OrderProduct]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              OrderProductSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _featureOrderSerialize(
  FeatureOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.hasCustomer);
  writer.writeBool(offsets[1], object.hasExchange);
  writer.writeBool(offsets[2], object.hasPhoto);
  writer.writeBool(offsets[3], object.hasPurchase);
  writer.writeBool(offsets[4], object.hasSampling);
  writer.writeLong(offsets[5], object.id);
  writer.writeBool(offsets[6], object.isCustomerRequired);
  writer.writeObjectList<OrderProduct>(
    offsets[7],
    allOffsets,
    OrderProductSchema.serialize,
    object.products,
  );
}

FeatureOrder _featureOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureOrder(
    hasCustomer: reader.readBoolOrNull(offsets[0]),
    hasExchange: reader.readBoolOrNull(offsets[1]),
    hasPhoto: reader.readBoolOrNull(offsets[2]),
    hasPurchase: reader.readBoolOrNull(offsets[3]),
    hasSampling: reader.readBoolOrNull(offsets[4]),
    id: reader.readLongOrNull(offsets[5]),
    isCustomerRequired: reader.readBoolOrNull(offsets[6]),
    products: reader.readObjectList<OrderProduct>(
      offsets[7],
      OrderProductSchema.deserialize,
      allOffsets,
      OrderProduct(),
    ),
  );
  return object;
}

P _featureOrderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<OrderProduct>(
        offset,
        OrderProductSchema.deserialize,
        allOffsets,
        OrderProduct(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureOrderQueryFilter
    on QueryBuilder<FeatureOrder, FeatureOrder, QFilterCondition> {
  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasCustomerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasCustomer',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasCustomerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasCustomer',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasCustomerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCustomer',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasExchangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasExchange',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasExchangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasExchange',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasExchangeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasExchange',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasPhoto',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasPhoto',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPhotoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPhoto',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPurchaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasPurchase',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPurchaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasPurchase',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasPurchaseEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPurchase',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasSamplingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasSampling',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasSamplingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasSampling',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      hasSamplingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSampling',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      isCustomerRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCustomerRequired',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      isCustomerRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCustomerRequired',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      isCustomerRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomerRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'products',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'products',
      ));
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FeatureOrderQueryObject
    on QueryBuilder<FeatureOrder, FeatureOrder, QFilterCondition> {
  QueryBuilder<FeatureOrder, FeatureOrder, QAfterFilterCondition>
      productsElement(FilterQuery<OrderProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'products');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureSchemeSchema = Schema(
  name: r'FeatureScheme',
  id: -8708511857358220429,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'exchanges': PropertySchema(
      id: 1,
      name: r'exchanges',
      type: IsarType.objectList,
      target: r'Exchange',
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _featureSchemeEstimateSize,
  serialize: _featureSchemeSerialize,
  deserialize: _featureSchemeDeserialize,
  deserializeProp: _featureSchemeDeserializeProp,
);

int _featureSchemeEstimateSize(
  FeatureScheme object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.exchanges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Exchange]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ExchangeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _featureSchemeSerialize(
  FeatureScheme object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeObjectList<Exchange>(
    offsets[1],
    allOffsets,
    ExchangeSchema.serialize,
    object.exchanges,
  );
  writer.writeLong(offsets[2], object.id);
  writer.writeString(offsets[3], object.name);
}

FeatureScheme _featureSchemeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureScheme(
    description: reader.readStringOrNull(offsets[0]),
    exchanges: reader.readObjectList<Exchange>(
      offsets[1],
      ExchangeSchema.deserialize,
      allOffsets,
      Exchange(),
    ),
    id: reader.readLongOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _featureSchemeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Exchange>(
        offset,
        ExchangeSchema.deserialize,
        allOffsets,
        Exchange(),
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureSchemeQueryFilter
    on QueryBuilder<FeatureScheme, FeatureScheme, QFilterCondition> {
  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exchanges',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exchanges',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchanges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
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

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FeatureSchemeQueryObject
    on QueryBuilder<FeatureScheme, FeatureScheme, QFilterCondition> {
  QueryBuilder<FeatureScheme, FeatureScheme, QAfterFilterCondition>
      exchangesElement(FilterQuery<Exchange> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exchanges');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureCustomerSchema = Schema(
  name: r'FeatureCustomer',
  id: -2515128316323346941,
  properties: {
    r'dataType': PropertySchema(
      id: 0,
      name: r'dataType',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'isIdentity': PropertySchema(
      id: 3,
      name: r'isIdentity',
      type: IsarType.bool,
    ),
    r'isRequired': PropertySchema(
      id: 4,
      name: r'isRequired',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'options': PropertySchema(
      id: 6,
      name: r'options',
      type: IsarType.objectList,
      target: r'Option',
    ),
    r'ordinal': PropertySchema(
      id: 7,
      name: r'ordinal',
      type: IsarType.long,
    )
  },
  estimateSize: _featureCustomerEstimateSize,
  serialize: _featureCustomerSerialize,
  deserialize: _featureCustomerDeserialize,
  deserializeProp: _featureCustomerDeserializeProp,
);

int _featureCustomerEstimateSize(
  FeatureCustomer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dataType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.options;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Option]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += OptionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _featureCustomerSerialize(
  FeatureCustomer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dataType);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.id);
  writer.writeBool(offsets[3], object.isIdentity);
  writer.writeBool(offsets[4], object.isRequired);
  writer.writeString(offsets[5], object.name);
  writer.writeObjectList<Option>(
    offsets[6],
    allOffsets,
    OptionSchema.serialize,
    object.options,
  );
  writer.writeLong(offsets[7], object.ordinal);
}

FeatureCustomer _featureCustomerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureCustomer(
    dataType: reader.readStringOrNull(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    isIdentity: reader.readBoolOrNull(offsets[3]),
    isRequired: reader.readBoolOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[5]),
    options: reader.readObjectList<Option>(
      offsets[6],
      OptionSchema.deserialize,
      allOffsets,
      Option(),
    ),
    ordinal: reader.readLongOrNull(offsets[7]),
  );
  return object;
}

P _featureCustomerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<Option>(
        offset,
        OptionSchema.deserialize,
        allOffsets,
        Option(),
      )) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureCustomerQueryFilter
    on QueryBuilder<FeatureCustomer, FeatureCustomer, QFilterCondition> {
  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dataType',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dataType',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataType',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      dataTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataType',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
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

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
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

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
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

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isIdentityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isIdentity',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isIdentityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isIdentity',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isIdentityEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIdentity',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isRequiredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRequired',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isRequiredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRequired',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      isRequiredEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeatureCustomerQueryObject
    on QueryBuilder<FeatureCustomer, FeatureCustomer, QFilterCondition> {
  QueryBuilder<FeatureCustomer, FeatureCustomer, QAfterFilterCondition>
      optionsElement(FilterQuery<Option> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'options');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeatureSamplingSchema = Schema(
  name: r'FeatureSampling',
  id: -215205104042668557,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'ordinal': PropertySchema(
      id: 1,
      name: r'ordinal',
      type: IsarType.long,
    ),
    r'product': PropertySchema(
      id: 2,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 3,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    )
  },
  estimateSize: _featureSamplingEstimateSize,
  serialize: _featureSamplingSerialize,
  deserialize: _featureSamplingDeserialize,
  deserializeProp: _featureSamplingDeserializeProp,
);

int _featureSamplingEstimateSize(
  FeatureSampling object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.product;
    if (value != null) {
      bytesCount += 3 +
          ProductSchema.estimateSize(value, allOffsets[Product]!, allOffsets);
    }
  }
  {
    final value = object.productPackaging;
    if (value != null) {
      bytesCount += 3 +
          ProductPackagingSchema.estimateSize(
              value, allOffsets[ProductPackaging]!, allOffsets);
    }
  }
  return bytesCount;
}

void _featureSamplingSerialize(
  FeatureSampling object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeLong(offsets[1], object.ordinal);
  writer.writeObject<Product>(
    offsets[2],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[3],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
}

FeatureSampling _featureSamplingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureSampling(
    id: reader.readLongOrNull(offsets[0]),
    ordinal: reader.readLongOrNull(offsets[1]),
    product: reader.readObjectOrNull<Product>(
      offsets[2],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[3],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _featureSamplingDeserializeProp<P>(
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
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeatureSamplingQueryFilter
    on QueryBuilder<FeatureSampling, FeatureSampling, QFilterCondition> {
  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
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

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
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

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
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

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordinal',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordinal',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      ordinalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }
}

extension FeatureSamplingQueryObject
    on QueryBuilder<FeatureSampling, FeatureSampling, QFilterCondition> {
  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<FeatureSampling, FeatureSampling, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExchangeSchema = Schema(
  name: r'Exchange',
  id: 5230011357051976320,
  properties: {
    r'exchangeConditions': PropertySchema(
      id: 0,
      name: r'exchangeConditions',
      type: IsarType.objectList,
      target: r'ExchangeCondition',
    ),
    r'exchangeProceeds': PropertySchema(
      id: 1,
      name: r'exchangeProceeds',
      type: IsarType.objectList,
      target: r'ExchangeProceed',
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'logical': PropertySchema(
      id: 3,
      name: r'logical',
      type: IsarType.string,
    ),
    r'maxReceiveQuantity': PropertySchema(
      id: 4,
      name: r'maxReceiveQuantity',
      type: IsarType.long,
    ),
    r'reachAmount': PropertySchema(
      id: 5,
      name: r'reachAmount',
      type: IsarType.long,
    )
  },
  estimateSize: _exchangeEstimateSize,
  serialize: _exchangeSerialize,
  deserialize: _exchangeDeserialize,
  deserializeProp: _exchangeDeserializeProp,
);

int _exchangeEstimateSize(
  Exchange object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.exchangeConditions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ExchangeCondition]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ExchangeConditionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.exchangeProceeds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ExchangeProceed]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ExchangeProceedSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.logical;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _exchangeSerialize(
  Exchange object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ExchangeCondition>(
    offsets[0],
    allOffsets,
    ExchangeConditionSchema.serialize,
    object.exchangeConditions,
  );
  writer.writeObjectList<ExchangeProceed>(
    offsets[1],
    allOffsets,
    ExchangeProceedSchema.serialize,
    object.exchangeProceeds,
  );
  writer.writeLong(offsets[2], object.id);
  writer.writeString(offsets[3], object.logical);
  writer.writeLong(offsets[4], object.maxReceiveQuantity);
  writer.writeLong(offsets[5], object.reachAmount);
}

Exchange _exchangeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Exchange(
    exchangeConditions: reader.readObjectList<ExchangeCondition>(
      offsets[0],
      ExchangeConditionSchema.deserialize,
      allOffsets,
      ExchangeCondition(),
    ),
    exchangeProceeds: reader.readObjectList<ExchangeProceed>(
      offsets[1],
      ExchangeProceedSchema.deserialize,
      allOffsets,
      ExchangeProceed(),
    ),
    id: reader.readLongOrNull(offsets[2]),
    logical: reader.readStringOrNull(offsets[3]),
    maxReceiveQuantity: reader.readLongOrNull(offsets[4]),
    reachAmount: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _exchangeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ExchangeCondition>(
        offset,
        ExchangeConditionSchema.deserialize,
        allOffsets,
        ExchangeCondition(),
      )) as P;
    case 1:
      return (reader.readObjectList<ExchangeProceed>(
        offset,
        ExchangeProceedSchema.deserialize,
        allOffsets,
        ExchangeProceed(),
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExchangeQueryFilter
    on QueryBuilder<Exchange, Exchange, QFilterCondition> {
  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exchangeConditions',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exchangeConditions',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeConditions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exchangeProceeds',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exchangeProceeds',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exchangeProceeds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logical',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logical',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logical',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logical',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logical',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logical',
        value: '',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> logicalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logical',
        value: '',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxReceiveQuantity',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxReceiveQuantity',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxReceiveQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxReceiveQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxReceiveQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      maxReceiveQuantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxReceiveQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> reachAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reachAmount',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      reachAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reachAmount',
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> reachAmountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reachAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      reachAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reachAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> reachAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reachAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition> reachAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reachAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExchangeQueryObject
    on QueryBuilder<Exchange, Exchange, QFilterCondition> {
  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeConditionsElement(FilterQuery<ExchangeCondition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exchangeConditions');
    });
  }

  QueryBuilder<Exchange, Exchange, QAfterFilterCondition>
      exchangeProceedsElement(FilterQuery<ExchangeProceed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exchangeProceeds');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExchangeConditionSchema = Schema(
  name: r'ExchangeCondition',
  id: 3339967235942927485,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'product': PropertySchema(
      id: 1,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 2,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _exchangeConditionEstimateSize,
  serialize: _exchangeConditionSerialize,
  deserialize: _exchangeConditionDeserialize,
  deserializeProp: _exchangeConditionDeserializeProp,
);

int _exchangeConditionEstimateSize(
  ExchangeCondition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.product;
    if (value != null) {
      bytesCount += 3 +
          ProductSchema.estimateSize(value, allOffsets[Product]!, allOffsets);
    }
  }
  {
    final value = object.productPackaging;
    if (value != null) {
      bytesCount += 3 +
          ProductPackagingSchema.estimateSize(
              value, allOffsets[ProductPackaging]!, allOffsets);
    }
  }
  return bytesCount;
}

void _exchangeConditionSerialize(
  ExchangeCondition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeObject<Product>(
    offsets[1],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[2],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
  writer.writeLong(offsets[3], object.quantity);
}

ExchangeCondition _exchangeConditionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExchangeCondition(
    id: reader.readLongOrNull(offsets[0]),
    product: reader.readObjectOrNull<Product>(
      offsets[1],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[2],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
    quantity: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _exchangeConditionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExchangeConditionQueryFilter
    on QueryBuilder<ExchangeCondition, ExchangeCondition, QFilterCondition> {
  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
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

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
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

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
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

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExchangeConditionQueryObject
    on QueryBuilder<ExchangeCondition, ExchangeCondition, QFilterCondition> {
  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      product(FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<ExchangeCondition, ExchangeCondition, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExchangeProceedSchema = Schema(
  name: r'ExchangeProceed',
  id: 9002125092770463445,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'item': PropertySchema(
      id: 1,
      name: r'item',
      type: IsarType.object,
      target: r'Item',
    ),
    r'product': PropertySchema(
      id: 2,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 3,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _exchangeProceedEstimateSize,
  serialize: _exchangeProceedSerialize,
  deserialize: _exchangeProceedDeserialize,
  deserializeProp: _exchangeProceedDeserializeProp,
);

int _exchangeProceedEstimateSize(
  ExchangeProceed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.item;
    if (value != null) {
      bytesCount +=
          3 + ItemSchema.estimateSize(value, allOffsets[Item]!, allOffsets);
    }
  }
  {
    final value = object.product;
    if (value != null) {
      bytesCount += 3 +
          ProductSchema.estimateSize(value, allOffsets[Product]!, allOffsets);
    }
  }
  {
    final value = object.productPackaging;
    if (value != null) {
      bytesCount += 3 +
          ProductPackagingSchema.estimateSize(
              value, allOffsets[ProductPackaging]!, allOffsets);
    }
  }
  return bytesCount;
}

void _exchangeProceedSerialize(
  ExchangeProceed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeObject<Item>(
    offsets[1],
    allOffsets,
    ItemSchema.serialize,
    object.item,
  );
  writer.writeObject<Product>(
    offsets[2],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[3],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
  writer.writeLong(offsets[4], object.quantity);
}

ExchangeProceed _exchangeProceedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExchangeProceed(
    id: reader.readLongOrNull(offsets[0]),
    item: reader.readObjectOrNull<Item>(
      offsets[1],
      ItemSchema.deserialize,
      allOffsets,
    ),
    product: reader.readObjectOrNull<Product>(
      offsets[2],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[3],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
    quantity: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _exchangeProceedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Item>(
        offset,
        ItemSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExchangeProceedQueryFilter
    on QueryBuilder<ExchangeProceed, ExchangeProceed, QFilterCondition> {
  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
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

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
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

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
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

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExchangeProceedQueryObject
    on QueryBuilder<ExchangeProceed, ExchangeProceed, QFilterCondition> {
  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition> item(
      FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<ExchangeProceed, ExchangeProceed, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OptionSchema = Schema(
  name: r'Option',
  id: -5786321349724631965,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _optionEstimateSize,
  serialize: _optionSerialize,
  deserialize: _optionDeserialize,
  deserializeProp: _optionDeserializeProp,
);

int _optionEstimateSize(
  Option object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _optionSerialize(
  Option object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
}

Option _optionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Option(
    id: reader.readLongOrNull(offsets[0]),
    name: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _optionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OptionQueryFilter on QueryBuilder<Option, Option, QFilterCondition> {
  QueryBuilder<Option, Option, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Option, Option, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Option, Option, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Option, Option, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Option, Option, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension OptionQueryObject on QueryBuilder<Option, Option, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ItemSchema = Schema(
  name: r'Item',
  id: 7900997316587104717,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'imageUrl': PropertySchema(
      id: 3,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'itemTypeName': PropertySchema(
      id: 4,
      name: r'itemTypeName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'unitName': PropertySchema(
      id: 6,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _itemEstimateSize,
  serialize: _itemSerialize,
  deserialize: _itemDeserialize,
  deserializeProp: _itemDeserializeProp,
);

int _itemEstimateSize(
  Item object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemTypeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _itemSerialize(
  Item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeLong(offsets[2], object.id);
  writer.writeString(offsets[3], object.imageUrl);
  writer.writeString(offsets[4], object.itemTypeName);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.unitName);
}

Item _itemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Item(
    code: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[2]),
    imageUrl: reader.readStringOrNull(offsets[3]),
    itemTypeName: reader.readStringOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[5]),
    unitName: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _itemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ItemQueryFilter on QueryBuilder<Item, Item, QFilterCondition> {
  QueryBuilder<Item, Item, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemTypeName',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemTypeName',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> itemTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension ItemQueryObject on QueryBuilder<Item, Item, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProductSchema = Schema(
  name: r'Product',
  id: -6222113721139403729,
  properties: {
    r'brandName': PropertySchema(
      id: 0,
      name: r'brandName',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'imageUrl': PropertySchema(
      id: 4,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _productEstimateSize,
  serialize: _productSerialize,
  deserialize: _productDeserialize,
  deserializeProp: _productDeserializeProp,
);

int _productEstimateSize(
  Product object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brandName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productSerialize(
  Product object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brandName);
  writer.writeString(offsets[1], object.code);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeLong(offsets[3], object.id);
  writer.writeString(offsets[4], object.imageUrl);
  writer.writeString(offsets[5], object.name);
}

Product _productDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Product(
    brandName: reader.readStringOrNull(offsets[0]),
    code: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[3]),
    imageUrl: reader.readStringOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _productDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProductQueryFilter
    on QueryBuilder<Product, Product, QFilterCondition> {
  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brandName',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brandName',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brandName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brandName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brandName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandName',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brandName',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ProductQueryObject
    on QueryBuilder<Product, Product, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProductPackagingSchema = Schema(
  name: r'ProductPackaging',
  id: -842621823150537539,
  properties: {
    r'barcode': PropertySchema(
      id: 0,
      name: r'barcode',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'price': PropertySchema(
      id: 3,
      name: r'price',
      type: IsarType.long,
    ),
    r'rate': PropertySchema(
      id: 4,
      name: r'rate',
      type: IsarType.long,
    ),
    r'unitName': PropertySchema(
      id: 5,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _productPackagingEstimateSize,
  serialize: _productPackagingSerialize,
  deserialize: _productPackagingDeserialize,
  deserializeProp: _productPackagingDeserializeProp,
);

int _productPackagingEstimateSize(
  ProductPackaging object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barcode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productPackagingSerialize(
  ProductPackaging object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcode);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeLong(offsets[2], object.id);
  writer.writeLong(offsets[3], object.price);
  writer.writeLong(offsets[4], object.rate);
  writer.writeString(offsets[5], object.unitName);
}

ProductPackaging _productPackagingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductPackaging(
    barcode: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[2]),
    price: reader.readLongOrNull(offsets[3]),
    rate: reader.readLongOrNull(offsets[4]),
    unitName: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _productPackagingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProductPackagingQueryFilter
    on QueryBuilder<ProductPackaging, ProductPackaging, QFilterCondition> {
  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
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

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      priceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      rateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPackaging, ProductPackaging, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension ProductPackagingQueryObject
    on QueryBuilder<ProductPackaging, ProductPackaging, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OrderProductSchema = Schema(
  name: r'OrderProduct',
  id: 9014927253170020184,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'price': PropertySchema(
      id: 1,
      name: r'price',
      type: IsarType.long,
    ),
    r'product': PropertySchema(
      id: 2,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 3,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    )
  },
  estimateSize: _orderProductEstimateSize,
  serialize: _orderProductSerialize,
  deserialize: _orderProductDeserialize,
  deserializeProp: _orderProductDeserializeProp,
);

int _orderProductEstimateSize(
  OrderProduct object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.product;
    if (value != null) {
      bytesCount += 3 +
          ProductSchema.estimateSize(value, allOffsets[Product]!, allOffsets);
    }
  }
  {
    final value = object.productPackaging;
    if (value != null) {
      bytesCount += 3 +
          ProductPackagingSchema.estimateSize(
              value, allOffsets[ProductPackaging]!, allOffsets);
    }
  }
  return bytesCount;
}

void _orderProductSerialize(
  OrderProduct object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeLong(offsets[1], object.price);
  writer.writeObject<Product>(
    offsets[2],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[3],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
}

OrderProduct _orderProductDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderProduct(
    id: reader.readLongOrNull(offsets[0]),
    price: reader.readLongOrNull(offsets[1]),
    product: reader.readObjectOrNull<Product>(
      offsets[2],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[3],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _orderProductDeserializeProp<P>(
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
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OrderProductQueryFilter
    on QueryBuilder<OrderProduct, OrderProduct, QFilterCondition> {
  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> priceEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      priceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> priceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> priceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }
}

extension OrderProductQueryObject
    on QueryBuilder<OrderProduct, OrderProduct, QFilterCondition> {
  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<OrderProduct, OrderProduct, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}
