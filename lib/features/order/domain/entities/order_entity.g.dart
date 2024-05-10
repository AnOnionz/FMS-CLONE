// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderEntityCollection on Isar {
  IsarCollection<OrderEntity> get orderEntitys => this.collection();
}

const OrderEntitySchema = CollectionSchema(
  name: r'OrderEntity',
  id: 4301709931984059335,
  properties: {
    r'attendanceId': PropertySchema(
      id: 0,
      name: r'attendanceId',
      type: IsarType.long,
    ),
    r'customerInfos': PropertySchema(
      id: 1,
      name: r'customerInfos',
      type: IsarType.objectList,
      target: r'CustomerInfo',
    ),
    r'dataTimestamp': PropertySchema(
      id: 2,
      name: r'dataTimestamp',
      type: IsarType.dateTime,
    ),
    r'dataUuid': PropertySchema(
      id: 3,
      name: r'dataUuid',
      type: IsarType.string,
    ),
    r'exchanges': PropertySchema(
      id: 4,
      name: r'exchanges',
      type: IsarType.objectList,
      target: r'ExchangeEntity',
    ),
    r'featureId': PropertySchema(
      id: 5,
      name: r'featureId',
      type: IsarType.long,
    ),
    r'purchases': PropertySchema(
      id: 6,
      name: r'purchases',
      type: IsarType.objectList,
      target: r'PurchaseEntity',
    ),
    r'samplings': PropertySchema(
      id: 7,
      name: r'samplings',
      type: IsarType.objectList,
      target: r'SamplingEntity',
    ),
    r'totalPrice': PropertySchema(
      id: 8,
      name: r'totalPrice',
      type: IsarType.long,
    )
  },
  estimateSize: _orderEntityEstimateSize,
  serialize: _orderEntitySerialize,
  deserialize: _orderEntityDeserialize,
  deserializeProp: _orderEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {
    r'lcoalPhotos': LinkSchema(
      id: 2926993346189133668,
      name: r'lcoalPhotos',
      target: r'PhotoEntity',
      single: false,
    )
  },
  embeddedSchemas: {
    r'CustomerInfo': CustomerInfoSchema,
    r'CustomerOption': CustomerOptionSchema,
    r'PurchaseEntity': PurchaseEntitySchema,
    r'ExchangeEntity': ExchangeEntitySchema,
    r'SamplingEntity': SamplingEntitySchema
  },
  getId: _orderEntityGetId,
  getLinks: _orderEntityGetLinks,
  attach: _orderEntityAttach,
  version: '3.1.0+1',
);

int _orderEntityEstimateSize(
  OrderEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.customerInfos;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CustomerInfo]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CustomerInfoSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.dataUuid.length * 3;
  {
    final list = object.exchanges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ExchangeEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ExchangeEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.purchases;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PurchaseEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PurchaseEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.samplings;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SamplingEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SamplingEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _orderEntitySerialize(
  OrderEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attendanceId);
  writer.writeObjectList<CustomerInfo>(
    offsets[1],
    allOffsets,
    CustomerInfoSchema.serialize,
    object.customerInfos,
  );
  writer.writeDateTime(offsets[2], object.dataTimestamp);
  writer.writeString(offsets[3], object.dataUuid);
  writer.writeObjectList<ExchangeEntity>(
    offsets[4],
    allOffsets,
    ExchangeEntitySchema.serialize,
    object.exchanges,
  );
  writer.writeLong(offsets[5], object.featureId);
  writer.writeObjectList<PurchaseEntity>(
    offsets[6],
    allOffsets,
    PurchaseEntitySchema.serialize,
    object.purchases,
  );
  writer.writeObjectList<SamplingEntity>(
    offsets[7],
    allOffsets,
    SamplingEntitySchema.serialize,
    object.samplings,
  );
  writer.writeLong(offsets[8], object.totalPrice);
}

OrderEntity _orderEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderEntity(
    attendanceId: reader.readLongOrNull(offsets[0]),
    customerInfos: reader.readObjectList<CustomerInfo>(
      offsets[1],
      CustomerInfoSchema.deserialize,
      allOffsets,
      CustomerInfo(),
    ),
    dataTimestamp: reader.readDateTime(offsets[2]),
    dataUuid: reader.readString(offsets[3]),
    exchanges: reader.readObjectList<ExchangeEntity>(
      offsets[4],
      ExchangeEntitySchema.deserialize,
      allOffsets,
      ExchangeEntity(),
    ),
    featureId: reader.readLongOrNull(offsets[5]),
    purchases: reader.readObjectList<PurchaseEntity>(
      offsets[6],
      PurchaseEntitySchema.deserialize,
      allOffsets,
      PurchaseEntity(),
    ),
    samplings: reader.readObjectList<SamplingEntity>(
      offsets[7],
      SamplingEntitySchema.deserialize,
      allOffsets,
      SamplingEntity(),
    ),
  );
  return object;
}

P _orderEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<CustomerInfo>(
        offset,
        CustomerInfoSchema.deserialize,
        allOffsets,
        CustomerInfo(),
      )) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectList<ExchangeEntity>(
        offset,
        ExchangeEntitySchema.deserialize,
        allOffsets,
        ExchangeEntity(),
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<PurchaseEntity>(
        offset,
        PurchaseEntitySchema.deserialize,
        allOffsets,
        PurchaseEntity(),
      )) as P;
    case 7:
      return (reader.readObjectList<SamplingEntity>(
        offset,
        SamplingEntitySchema.deserialize,
        allOffsets,
        SamplingEntity(),
      )) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderEntityGetId(OrderEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _orderEntityGetLinks(OrderEntity object) {
  return [object.lcoalPhotos];
}

void _orderEntityAttach(
    IsarCollection<dynamic> col, Id id, OrderEntity object) {
  object.lcoalPhotos
      .attach(col, col.isar.collection<PhotoEntity>(), r'lcoalPhotos', id);
}

extension OrderEntityQueryWhereSort
    on QueryBuilder<OrderEntity, OrderEntity, QWhere> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderEntityQueryWhere
    on QueryBuilder<OrderEntity, OrderEntity, QWhereClause> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdBetween(
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

extension OrderEntityQueryFilter
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      attendanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      attendanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendanceId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      attendanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerInfos',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerInfos',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerInfos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      dataTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> dataUuidEqualTo(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> dataUuidBetween(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      dataUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> dataUuidMatches(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      dataUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      dataUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      exchangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exchanges',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      exchangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exchanges',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      featureIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      featureIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      featureIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchases',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchases',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'samplings',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'samplings',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalPriceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalPriceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalPriceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalPriceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrderEntityQueryObject
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      customerInfosElement(FilterQuery<CustomerInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'customerInfos');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      exchangesElement(FilterQuery<ExchangeEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exchanges');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      purchasesElement(FilterQuery<PurchaseEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'purchases');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      samplingsElement(FilterQuery<SamplingEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'samplings');
    });
  }
}

extension OrderEntityQueryLinks
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> lcoalPhotos(
      FilterQuery<PhotoEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lcoalPhotos');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lcoalPhotos', length, true, length, true);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lcoalPhotos', 0, true, 0, true);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lcoalPhotos', 0, false, 999999, true);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lcoalPhotos', 0, true, length, include);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lcoalPhotos', length, include, 999999, true);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lcoalPhotosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'lcoalPhotos', lower, includeLower, upper, includeUpper);
    });
  }
}

extension OrderEntityQuerySortBy
    on QueryBuilder<OrderEntity, OrderEntity, QSortBy> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension OrderEntityQuerySortThenBy
    on QueryBuilder<OrderEntity, OrderEntity, QSortThenBy> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByAttendanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendanceId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByDataTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTimestamp', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByDataUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByDataUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataUuid', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFeatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featureId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension OrderEntityQueryWhereDistinct
    on QueryBuilder<OrderEntity, OrderEntity, QDistinct> {
  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByAttendanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendanceId');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByDataTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTimestamp');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByDataUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByFeatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featureId');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }
}

extension OrderEntityQueryProperty
    on QueryBuilder<OrderEntity, OrderEntity, QQueryProperty> {
  QueryBuilder<OrderEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<OrderEntity, int?, QQueryOperations> attendanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendanceId');
    });
  }

  QueryBuilder<OrderEntity, List<CustomerInfo>?, QQueryOperations>
      customerInfosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerInfos');
    });
  }

  QueryBuilder<OrderEntity, DateTime, QQueryOperations>
      dataTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTimestamp');
    });
  }

  QueryBuilder<OrderEntity, String, QQueryOperations> dataUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataUuid');
    });
  }

  QueryBuilder<OrderEntity, List<ExchangeEntity>?, QQueryOperations>
      exchangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exchanges');
    });
  }

  QueryBuilder<OrderEntity, int?, QQueryOperations> featureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featureId');
    });
  }

  QueryBuilder<OrderEntity, List<PurchaseEntity>?, QQueryOperations>
      purchasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchases');
    });
  }

  QueryBuilder<OrderEntity, List<SamplingEntity>?, QQueryOperations>
      samplingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'samplings');
    });
  }

  QueryBuilder<OrderEntity, int, QQueryOperations> totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerInfoSchema = Schema(
  name: r'CustomerInfo',
  id: -1237964095628758933,
  properties: {
    r'featureCustomerId': PropertySchema(
      id: 0,
      name: r'featureCustomerId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'options': PropertySchema(
      id: 2,
      name: r'options',
      type: IsarType.objectList,
      target: r'CustomerOption',
    ),
    r'value': PropertySchema(
      id: 3,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _customerInfoEstimateSize,
  serialize: _customerInfoSerialize,
  deserialize: _customerInfoDeserialize,
  deserializeProp: _customerInfoDeserializeProp,
);

int _customerInfoEstimateSize(
  CustomerInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.options;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CustomerOption]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CustomerOptionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _customerInfoSerialize(
  CustomerInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureCustomerId);
  writer.writeLong(offsets[1], object.id);
  writer.writeObjectList<CustomerOption>(
    offsets[2],
    allOffsets,
    CustomerOptionSchema.serialize,
    object.options,
  );
  writer.writeString(offsets[3], object.value);
}

CustomerInfo _customerInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerInfo(
    featureCustomerId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    options: reader.readObjectList<CustomerOption>(
      offsets[2],
      CustomerOptionSchema.deserialize,
      allOffsets,
      CustomerOption(),
    ),
    value: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _customerInfoDeserializeProp<P>(
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
      return (reader.readObjectList<CustomerOption>(
        offset,
        CustomerOptionSchema.deserialize,
        allOffsets,
        CustomerOption(),
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerInfoQueryFilter
    on QueryBuilder<CustomerInfo, CustomerInfo, QFilterCondition> {
  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureCustomerId',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureCustomerId',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureCustomerId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureCustomerId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureCustomerId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      featureCustomerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureCustomerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      optionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      optionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
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

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension CustomerInfoQueryObject
    on QueryBuilder<CustomerInfo, CustomerInfo, QFilterCondition> {
  QueryBuilder<CustomerInfo, CustomerInfo, QAfterFilterCondition>
      optionsElement(FilterQuery<CustomerOption> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'options');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerOptionSchema = Schema(
  name: r'CustomerOption',
  id: -519173673886872718,
  properties: {
    r'featureCustomerOptionId': PropertySchema(
      id: 0,
      name: r'featureCustomerOptionId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    )
  },
  estimateSize: _customerOptionEstimateSize,
  serialize: _customerOptionSerialize,
  deserialize: _customerOptionDeserialize,
  deserializeProp: _customerOptionDeserializeProp,
);

int _customerOptionEstimateSize(
  CustomerOption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _customerOptionSerialize(
  CustomerOption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureCustomerOptionId);
  writer.writeLong(offsets[1], object.id);
}

CustomerOption _customerOptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerOption(
    featureCustomerOptionId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _customerOptionDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerOptionQueryFilter
    on QueryBuilder<CustomerOption, CustomerOption, QFilterCondition> {
  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureCustomerOptionId',
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureCustomerOptionId',
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureCustomerOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureCustomerOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureCustomerOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      featureCustomerOptionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureCustomerOptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
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

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition>
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

  QueryBuilder<CustomerOption, CustomerOption, QAfterFilterCondition> idBetween(
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
}

extension CustomerOptionQueryObject
    on QueryBuilder<CustomerOption, CustomerOption, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PurchaseEntitySchema = Schema(
  name: r'PurchaseEntity',
  id: -2985345532096524035,
  properties: {
    r'featureOrderProductId': PropertySchema(
      id: 0,
      name: r'featureOrderProductId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _purchaseEntityEstimateSize,
  serialize: _purchaseEntitySerialize,
  deserialize: _purchaseEntityDeserialize,
  deserializeProp: _purchaseEntityDeserializeProp,
);

int _purchaseEntityEstimateSize(
  PurchaseEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _purchaseEntitySerialize(
  PurchaseEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureOrderProductId);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.quantity);
}

PurchaseEntity _purchaseEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseEntity(
    featureOrderProductId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    quantity: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _purchaseEntityDeserializeProp<P>(
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

extension PurchaseEntityQueryFilter
    on QueryBuilder<PurchaseEntity, PurchaseEntity, QFilterCondition> {
  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureOrderProductId',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureOrderProductId',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureOrderProductId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureOrderProductId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureOrderProductId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      featureOrderProductIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureOrderProductId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
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

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
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

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
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

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
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

  QueryBuilder<PurchaseEntity, PurchaseEntity, QAfterFilterCondition>
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

extension PurchaseEntityQueryObject
    on QueryBuilder<PurchaseEntity, PurchaseEntity, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExchangeEntitySchema = Schema(
  name: r'ExchangeEntity',
  id: -3159729755724177288,
  properties: {
    r'featureSchemeExchangeId': PropertySchema(
      id: 0,
      name: r'featureSchemeExchangeId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _exchangeEntityEstimateSize,
  serialize: _exchangeEntitySerialize,
  deserialize: _exchangeEntityDeserialize,
  deserializeProp: _exchangeEntityDeserializeProp,
);

int _exchangeEntityEstimateSize(
  ExchangeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _exchangeEntitySerialize(
  ExchangeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureSchemeExchangeId);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.quantity);
}

ExchangeEntity _exchangeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExchangeEntity(
    featureSchemeExchangeId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    quantity: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _exchangeEntityDeserializeProp<P>(
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

extension ExchangeEntityQueryFilter
    on QueryBuilder<ExchangeEntity, ExchangeEntity, QFilterCondition> {
  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureSchemeExchangeId',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureSchemeExchangeId',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureSchemeExchangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featureSchemeExchangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featureSchemeExchangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      featureSchemeExchangeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featureSchemeExchangeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
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

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
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

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
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

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
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

  QueryBuilder<ExchangeEntity, ExchangeEntity, QAfterFilterCondition>
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

extension ExchangeEntityQueryObject
    on QueryBuilder<ExchangeEntity, ExchangeEntity, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SamplingEntitySchema = Schema(
  name: r'SamplingEntity',
  id: 4912424377293578739,
  properties: {
    r'featureSamplingId': PropertySchema(
      id: 0,
      name: r'featureSamplingId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _samplingEntityEstimateSize,
  serialize: _samplingEntitySerialize,
  deserialize: _samplingEntityDeserialize,
  deserializeProp: _samplingEntityDeserializeProp,
);

int _samplingEntityEstimateSize(
  SamplingEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _samplingEntitySerialize(
  SamplingEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.featureSamplingId);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.quantity);
}

SamplingEntity _samplingEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SamplingEntity(
    featureSamplingId: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    quantity: reader.readLongOrNull(offsets[2]),
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
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SamplingEntityQueryFilter
    on QueryBuilder<SamplingEntity, SamplingEntity, QFilterCondition> {
  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureSamplingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'featureSamplingId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureSamplingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'featureSamplingId',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      featureSamplingIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featureSamplingId',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

  QueryBuilder<SamplingEntity, SamplingEntity, QAfterFilterCondition>
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

extension SamplingEntityQueryObject
    on QueryBuilder<SamplingEntity, SamplingEntity, QFilterCondition> {}
