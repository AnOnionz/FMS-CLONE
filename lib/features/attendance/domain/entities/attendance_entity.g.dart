// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AttendanceEntitySchema = Schema(
  name: r'AttendanceEntity',
  id: 5479936569571385882,
  properties: {
    r'dataIn': PropertySchema(
      id: 0,
      name: r'dataIn',
      type: IsarType.object,
      target: r'AttendanceData',
    ),
    r'dataOut': PropertySchema(
      id: 1,
      name: r'dataOut',
      type: IsarType.object,
      target: r'AttendanceData',
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'user': PropertySchema(
      id: 3,
      name: r'user',
      type: IsarType.object,
      target: r'EmployeeUserEntity',
    )
  },
  estimateSize: _attendanceEntityEstimateSize,
  serialize: _attendanceEntitySerialize,
  deserialize: _attendanceEntityDeserialize,
  deserializeProp: _attendanceEntityDeserializeProp,
);

int _attendanceEntityEstimateSize(
  AttendanceEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dataIn;
    if (value != null) {
      bytesCount += 3 +
          AttendanceDataSchema.estimateSize(
              value, allOffsets[AttendanceData]!, allOffsets);
    }
  }
  {
    final value = object.dataOut;
    if (value != null) {
      bytesCount += 3 +
          AttendanceDataSchema.estimateSize(
              value, allOffsets[AttendanceData]!, allOffsets);
    }
  }
  {
    final value = object.user;
    if (value != null) {
      bytesCount += 3 +
          EmployeeUserEntitySchema.estimateSize(
              value, allOffsets[EmployeeUserEntity]!, allOffsets);
    }
  }
  return bytesCount;
}

void _attendanceEntitySerialize(
  AttendanceEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AttendanceData>(
    offsets[0],
    allOffsets,
    AttendanceDataSchema.serialize,
    object.dataIn,
  );
  writer.writeObject<AttendanceData>(
    offsets[1],
    allOffsets,
    AttendanceDataSchema.serialize,
    object.dataOut,
  );
  writer.writeLong(offsets[2], object.id);
  writer.writeObject<EmployeeUserEntity>(
    offsets[3],
    allOffsets,
    EmployeeUserEntitySchema.serialize,
    object.user,
  );
}

AttendanceEntity _attendanceEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AttendanceEntity(
    dataIn: reader.readObjectOrNull<AttendanceData>(
      offsets[0],
      AttendanceDataSchema.deserialize,
      allOffsets,
    ),
    dataOut: reader.readObjectOrNull<AttendanceData>(
      offsets[1],
      AttendanceDataSchema.deserialize,
      allOffsets,
    ),
    id: reader.readLongOrNull(offsets[2]),
    user: reader.readObjectOrNull<EmployeeUserEntity>(
      offsets[3],
      EmployeeUserEntitySchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _attendanceEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AttendanceData>(
        offset,
        AttendanceDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<AttendanceData>(
        offset,
        AttendanceDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<EmployeeUserEntity>(
        offset,
        EmployeeUserEntitySchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AttendanceEntityQueryFilter
    on QueryBuilder<AttendanceEntity, AttendanceEntity, QFilterCondition> {
  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dataIn',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dataIn',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dataOut',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dataOut',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
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

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
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

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
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

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'user',
      ));
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      userIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'user',
      ));
    });
  }
}

extension AttendanceEntityQueryObject
    on QueryBuilder<AttendanceEntity, AttendanceEntity, QFilterCondition> {
  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataIn(FilterQuery<AttendanceData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dataIn');
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition>
      dataOut(FilterQuery<AttendanceData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dataOut');
    });
  }

  QueryBuilder<AttendanceEntity, AttendanceEntity, QAfterFilterCondition> user(
      FilterQuery<EmployeeUserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'user');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AttendanceDataSchema = Schema(
  name: r'AttendanceData',
  id: -7413827686772492060,
  properties: {
    r'deviceId': PropertySchema(
      id: 0,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'deviceTime': PropertySchema(
      id: 1,
      name: r'deviceTime',
      type: IsarType.dateTime,
    ),
    r'image': PropertySchema(
      id: 2,
      name: r'image',
      type: IsarType.object,
      target: r'ImageCloud',
    ),
    r'latitude': PropertySchema(
      id: 3,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 4,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _attendanceDataEstimateSize,
  serialize: _attendanceDataSerialize,
  deserialize: _attendanceDataDeserialize,
  deserializeProp: _attendanceDataDeserializeProp,
);

int _attendanceDataEstimateSize(
  AttendanceData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.deviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 +
          ImageCloudSchema.estimateSize(
              value, allOffsets[ImageCloud]!, allOffsets);
    }
  }
  return bytesCount;
}

void _attendanceDataSerialize(
  AttendanceData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deviceId);
  writer.writeDateTime(offsets[1], object.deviceTime);
  writer.writeObject<ImageCloud>(
    offsets[2],
    allOffsets,
    ImageCloudSchema.serialize,
    object.image,
  );
  writer.writeDouble(offsets[3], object.latitude);
  writer.writeDouble(offsets[4], object.longitude);
}

AttendanceData _attendanceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AttendanceData(
    deviceId: reader.readStringOrNull(offsets[0]),
    deviceTime: reader.readDateTimeOrNull(offsets[1]),
    image: reader.readObjectOrNull<ImageCloud>(
      offsets[2],
      ImageCloudSchema.deserialize,
      allOffsets,
    ),
    latitude: reader.readDoubleOrNull(offsets[3]),
    longitude: reader.readDoubleOrNull(offsets[4]),
  );
  return object;
}

P _attendanceDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<ImageCloud>(
        offset,
        ImageCloudSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AttendanceDataQueryFilter
    on QueryBuilder<AttendanceData, AttendanceData, QFilterCondition> {
  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceTime',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceTime',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      deviceTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition>
      longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension AttendanceDataQueryObject
    on QueryBuilder<AttendanceData, AttendanceData, QFilterCondition> {
  QueryBuilder<AttendanceData, AttendanceData, QAfterFilterCondition> image(
      FilterQuery<ImageCloud> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ImageCloudSchema = Schema(
  name: r'ImageCloud',
  id: 7385421064328724751,
  properties: {
    r'filename': PropertySchema(
      id: 0,
      name: r'filename',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'variants': PropertySchema(
      id: 2,
      name: r'variants',
      type: IsarType.stringList,
    )
  },
  estimateSize: _imageCloudEstimateSize,
  serialize: _imageCloudSerialize,
  deserialize: _imageCloudDeserialize,
  deserializeProp: _imageCloudDeserializeProp,
);

int _imageCloudEstimateSize(
  ImageCloud object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.filename;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.variants;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _imageCloudSerialize(
  ImageCloud object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.filename);
  writer.writeLong(offsets[1], object.id);
  writer.writeStringList(offsets[2], object.variants);
}

ImageCloud _imageCloudDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImageCloud(
    filename: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    variants: reader.readStringList(offsets[2]),
  );
  return object;
}

P _imageCloudDeserializeProp<P>(
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
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ImageCloudQueryFilter
    on QueryBuilder<ImageCloud, ImageCloud, QFilterCondition> {
  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filename',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      filenameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filename',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      filenameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filename',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      filenameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> filenameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filename',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      filenameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filename',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      filenameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filename',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition> variantsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'variants',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'variants',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variants',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variants',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variants',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variants',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageCloud, ImageCloud, QAfterFilterCondition>
      variantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variants',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ImageCloudQueryObject
    on QueryBuilder<ImageCloud, ImageCloud, QFilterCondition> {}
