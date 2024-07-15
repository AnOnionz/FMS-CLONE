// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sampling_value_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SamplingValueEntitySchema = Schema(
  name: r'SamplingValueEntity',
  id: 4878621107541144446,
  properties: {
    r'conversionRate': PropertySchema(
      id: 0,
      name: r'conversionRate',
      type: IsarType.double,
    ),
    r'conversionValue': PropertySchema(
      id: 1,
      name: r'conversionValue',
      type: IsarType.long,
    ),
    r'featureSamplingId': PropertySchema(
      id: 2,
      name: r'featureSamplingId',
      type: IsarType.long,
    ),
    r'hashCode': PropertySchema(
      id: 3,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 5,
      name: r'value',
      type: IsarType.long,
    )
  },
  estimateSize: _samplingValueEntityEstimateSize,
  serialize: _samplingValueEntitySerialize,
  deserialize: _samplingValueEntityDeserialize,
  deserializeProp: _samplingValueEntityDeserializeProp,
);

int _samplingValueEntityEstimateSize(
  SamplingValueEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _samplingValueEntitySerialize(
  SamplingValueEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.conversionRate);
  writer.writeLong(offsets[1], object.conversionValue);
  writer.writeLong(offsets[2], object.featureSamplingId);
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeLong(offsets[4], object.id);
  writer.writeLong(offsets[5], object.value);
}

SamplingValueEntity _samplingValueEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SamplingValueEntity(
    conversionRate: reader.readDoubleOrNull(offsets[0]),
    conversionValue: reader.readLongOrNull(offsets[1]),
    featureSamplingId: reader.readLongOrNull(offsets[2]),
    id: reader.readLongOrNull(offsets[4]),
    value: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _samplingValueEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SamplingValueEntityQueryFilter on QueryBuilder<SamplingValueEntity,
    SamplingValueEntity, QFilterCondition> {
  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conversionRate',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conversionRate',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conversionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conversionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conversionRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conversionValue',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conversionValue',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversionValue',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conversionValue',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conversionValue',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      conversionValueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conversionValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureSamplingId',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureSamplingId',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureSamplingId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureSamplingId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureSamplingId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      featureSamplingIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureSamplingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueGreaterThan(
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueLessThan(
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

  QueryBuilder<SamplingValueEntity, SamplingValueEntity, QAfterFilterCondition>
      valueBetween(
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

extension SamplingValueEntityQueryObject on QueryBuilder<SamplingValueEntity,
    SamplingValueEntity, QFilterCondition> {}
