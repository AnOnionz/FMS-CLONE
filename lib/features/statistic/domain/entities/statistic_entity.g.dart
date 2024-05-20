// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStatisticEntityCollection on Isar {
  IsarCollection<StatisticEntity> get statisticEntitys => this.collection();
}

const StatisticEntitySchema = CollectionSchema(
  name: r'StatisticEntity',
  id: 4328527988646859905,
  properties: {
    r'exchanges': PropertySchema(
      id: 0,
      name: r'exchanges',
      type: IsarType.objectList,
      target: r'ExchangeStatistic',
    ),
    r'purchases': PropertySchema(
      id: 1,
      name: r'purchases',
      type: IsarType.objectList,
      target: r'PurchaseStatistic',
    ),
    r'samplings': PropertySchema(
      id: 2,
      name: r'samplings',
      type: IsarType.objectList,
      target: r'SamplingStatistic',
    )
  },
  estimateSize: _statisticEntityEstimateSize,
  serialize: _statisticEntitySerialize,
  deserialize: _statisticEntityDeserialize,
  deserializeProp: _statisticEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'PurchaseStatistic': PurchaseStatisticSchema,
    r'Product': ProductSchema,
    r'ProductPackaging': ProductPackagingSchema,
    r'ExchangeStatistic': ExchangeStatisticSchema,
    r'Item': ItemSchema,
    r'SamplingStatistic': SamplingStatisticSchema
  },
  getId: _statisticEntityGetId,
  getLinks: _statisticEntityGetLinks,
  attach: _statisticEntityAttach,
  version: '3.1.0+1',
);

int _statisticEntityEstimateSize(
  StatisticEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exchanges.length * 3;
  {
    final offsets = allOffsets[ExchangeStatistic]!;
    for (var i = 0; i < object.exchanges.length; i++) {
      final value = object.exchanges[i];
      bytesCount +=
          ExchangeStatisticSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.purchases.length * 3;
  {
    final offsets = allOffsets[PurchaseStatistic]!;
    for (var i = 0; i < object.purchases.length; i++) {
      final value = object.purchases[i];
      bytesCount +=
          PurchaseStatisticSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.samplings.length * 3;
  {
    final offsets = allOffsets[SamplingStatistic]!;
    for (var i = 0; i < object.samplings.length; i++) {
      final value = object.samplings[i];
      bytesCount +=
          SamplingStatisticSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _statisticEntitySerialize(
  StatisticEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ExchangeStatistic>(
    offsets[0],
    allOffsets,
    ExchangeStatisticSchema.serialize,
    object.exchanges,
  );
  writer.writeObjectList<PurchaseStatistic>(
    offsets[1],
    allOffsets,
    PurchaseStatisticSchema.serialize,
    object.purchases,
  );
  writer.writeObjectList<SamplingStatistic>(
    offsets[2],
    allOffsets,
    SamplingStatisticSchema.serialize,
    object.samplings,
  );
}

StatisticEntity _statisticEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StatisticEntity(
    exchanges: reader.readObjectList<ExchangeStatistic>(
          offsets[0],
          ExchangeStatisticSchema.deserialize,
          allOffsets,
          ExchangeStatistic(),
        ) ??
        [],
    purchases: reader.readObjectList<PurchaseStatistic>(
          offsets[1],
          PurchaseStatisticSchema.deserialize,
          allOffsets,
          PurchaseStatistic(),
        ) ??
        [],
    samplings: reader.readObjectList<SamplingStatistic>(
          offsets[2],
          SamplingStatisticSchema.deserialize,
          allOffsets,
          SamplingStatistic(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _statisticEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ExchangeStatistic>(
            offset,
            ExchangeStatisticSchema.deserialize,
            allOffsets,
            ExchangeStatistic(),
          ) ??
          []) as P;
    case 1:
      return (reader.readObjectList<PurchaseStatistic>(
            offset,
            PurchaseStatisticSchema.deserialize,
            allOffsets,
            PurchaseStatistic(),
          ) ??
          []) as P;
    case 2:
      return (reader.readObjectList<SamplingStatistic>(
            offset,
            SamplingStatisticSchema.deserialize,
            allOffsets,
            SamplingStatistic(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _statisticEntityGetId(StatisticEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _statisticEntityGetLinks(StatisticEntity object) {
  return [];
}

void _statisticEntityAttach(
    IsarCollection<dynamic> col, Id id, StatisticEntity object) {
  object.id = id;
}

extension StatisticEntityQueryWhereSort
    on QueryBuilder<StatisticEntity, StatisticEntity, QWhere> {
  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StatisticEntityQueryWhere
    on QueryBuilder<StatisticEntity, StatisticEntity, QWhereClause> {
  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterWhereClause> idBetween(
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

extension StatisticEntityQueryFilter
    on QueryBuilder<StatisticEntity, StatisticEntity, QFilterCondition> {
  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
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
}

extension StatisticEntityQueryObject
    on QueryBuilder<StatisticEntity, StatisticEntity, QFilterCondition> {
  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      exchangesElement(FilterQuery<ExchangeStatistic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exchanges');
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      purchasesElement(FilterQuery<PurchaseStatistic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'purchases');
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterFilterCondition>
      samplingsElement(FilterQuery<SamplingStatistic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'samplings');
    });
  }
}

extension StatisticEntityQueryLinks
    on QueryBuilder<StatisticEntity, StatisticEntity, QFilterCondition> {}

extension StatisticEntityQuerySortBy
    on QueryBuilder<StatisticEntity, StatisticEntity, QSortBy> {}

extension StatisticEntityQuerySortThenBy
    on QueryBuilder<StatisticEntity, StatisticEntity, QSortThenBy> {
  QueryBuilder<StatisticEntity, StatisticEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StatisticEntity, StatisticEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension StatisticEntityQueryWhereDistinct
    on QueryBuilder<StatisticEntity, StatisticEntity, QDistinct> {}

extension StatisticEntityQueryProperty
    on QueryBuilder<StatisticEntity, StatisticEntity, QQueryProperty> {
  QueryBuilder<StatisticEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StatisticEntity, List<ExchangeStatistic>, QQueryOperations>
      exchangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exchanges');
    });
  }

  QueryBuilder<StatisticEntity, List<PurchaseStatistic>, QQueryOperations>
      purchasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchases');
    });
  }

  QueryBuilder<StatisticEntity, List<SamplingStatistic>, QQueryOperations>
      samplingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'samplings');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExchangeStatisticSchema = Schema(
  name: r'ExchangeStatistic',
  id: 3163454658869530156,
  properties: {
    r'item': PropertySchema(
      id: 0,
      name: r'item',
      type: IsarType.object,
      target: r'Item',
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
  estimateSize: _exchangeStatisticEstimateSize,
  serialize: _exchangeStatisticSerialize,
  deserialize: _exchangeStatisticDeserialize,
  deserializeProp: _exchangeStatisticDeserializeProp,
);

int _exchangeStatisticEstimateSize(
  ExchangeStatistic object,
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

void _exchangeStatisticSerialize(
  ExchangeStatistic object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Item>(
    offsets[0],
    allOffsets,
    ItemSchema.serialize,
    object.item,
  );
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

ExchangeStatistic _exchangeStatisticDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExchangeStatistic(
    item: reader.readObjectOrNull<Item>(
      offsets[0],
      ItemSchema.deserialize,
      allOffsets,
    ),
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

P _exchangeStatisticDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Item>(
        offset,
        ItemSchema.deserialize,
        allOffsets,
      )) as P;
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

extension ExchangeStatisticQueryFilter
    on QueryBuilder<ExchangeStatistic, ExchangeStatistic, QFilterCondition> {
  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
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

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
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

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
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

extension ExchangeStatisticQueryObject
    on QueryBuilder<ExchangeStatistic, ExchangeStatistic, QFilterCondition> {
  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      item(FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      product(FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<ExchangeStatistic, ExchangeStatistic, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PurchaseStatisticSchema = Schema(
  name: r'PurchaseStatistic',
  id: 7012173234855762857,
  properties: {
    r'product': PropertySchema(
      id: 0,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 1,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _purchaseStatisticEstimateSize,
  serialize: _purchaseStatisticSerialize,
  deserialize: _purchaseStatisticDeserialize,
  deserializeProp: _purchaseStatisticDeserializeProp,
);

int _purchaseStatisticEstimateSize(
  PurchaseStatistic object,
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

void _purchaseStatisticSerialize(
  PurchaseStatistic object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Product>(
    offsets[0],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[1],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
  writer.writeLong(offsets[2], object.quantity);
}

PurchaseStatistic _purchaseStatisticDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseStatistic(
    product: reader.readObjectOrNull<Product>(
      offsets[0],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[1],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
    quantity: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _purchaseStatisticDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PurchaseStatisticQueryFilter
    on QueryBuilder<PurchaseStatistic, PurchaseStatistic, QFilterCondition> {
  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
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

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
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

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
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

extension PurchaseStatisticQueryObject
    on QueryBuilder<PurchaseStatistic, PurchaseStatistic, QFilterCondition> {
  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      product(FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<PurchaseStatistic, PurchaseStatistic, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SamplingStatisticSchema = Schema(
  name: r'SamplingStatistic',
  id: 5891958254111070310,
  properties: {
    r'product': PropertySchema(
      id: 0,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'productPackaging': PropertySchema(
      id: 1,
      name: r'productPackaging',
      type: IsarType.object,
      target: r'ProductPackaging',
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _samplingStatisticEstimateSize,
  serialize: _samplingStatisticSerialize,
  deserialize: _samplingStatisticDeserialize,
  deserializeProp: _samplingStatisticDeserializeProp,
);

int _samplingStatisticEstimateSize(
  SamplingStatistic object,
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

void _samplingStatisticSerialize(
  SamplingStatistic object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Product>(
    offsets[0],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeObject<ProductPackaging>(
    offsets[1],
    allOffsets,
    ProductPackagingSchema.serialize,
    object.productPackaging,
  );
  writer.writeLong(offsets[2], object.quantity);
}

SamplingStatistic _samplingStatisticDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SamplingStatistic(
    product: reader.readObjectOrNull<Product>(
      offsets[0],
      ProductSchema.deserialize,
      allOffsets,
    ),
    productPackaging: reader.readObjectOrNull<ProductPackaging>(
      offsets[1],
      ProductPackagingSchema.deserialize,
      allOffsets,
    ),
    quantity: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _samplingStatisticDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Product>(
        offset,
        ProductSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<ProductPackaging>(
        offset,
        ProductPackagingSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SamplingStatisticQueryFilter
    on QueryBuilder<SamplingStatistic, SamplingStatistic, QFilterCondition> {
  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      productIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'product',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      productPackagingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      productPackagingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productPackaging',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
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

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
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

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
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

extension SamplingStatisticQueryObject
    on QueryBuilder<SamplingStatistic, SamplingStatistic, QFilterCondition> {
  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      product(FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }

  QueryBuilder<SamplingStatistic, SamplingStatistic, QAfterFilterCondition>
      productPackaging(FilterQuery<ProductPackaging> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productPackaging');
    });
  }
}
