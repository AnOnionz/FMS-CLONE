// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../general/domain/entities/config_entity.dart';

part 'statistic_entity.g.dart';

@collection
class StatisticEntity {
  Id? id;
  final List<PurchaseStatistic> purchases;
  final List<ExchangeStatistic> exchanges;
  final List<SamplingStatistic> samplings;

  StatisticEntity({
    required this.purchases,
    required this.exchanges,
    required this.samplings,
  });

  int get totalPurchase => purchases.fold(
      0, (previousValue, element) => previousValue + (element.quantity ?? 0));
  int get totalExchange => exchanges.fold(
      0, (previousValue, element) => previousValue + (element.quantity ?? 0));
  int get totalSampling => samplings.fold(
      0, (previousValue, element) => previousValue + (element.quantity ?? 0));

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchases': purchases.map((x) => x.toMap()).toList(),
      'exchanges': exchanges.map((x) => x.toMap()).toList(),
      'samplings': samplings.map((x) => x.toMap()).toList(),
    };
  }

  factory StatisticEntity.fromMap(Map<String, dynamic> map) {
    return StatisticEntity(
      purchases: List<PurchaseStatistic>.from(
        (map['purchases'] as List<dynamic>).map<PurchaseStatistic>(
          (x) => PurchaseStatistic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      exchanges: List<ExchangeStatistic>.from(
        (map['exchanges'] as List<dynamic>).map<ExchangeStatistic>(
          (x) => ExchangeStatistic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      samplings: List<SamplingStatistic>.from(
        (map['samplings'] as List<dynamic>).map<SamplingStatistic>(
          (x) => SamplingStatistic.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatisticEntity.fromJson(String source) =>
      StatisticEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  StatisticEntity copyWith({
    List<PurchaseStatistic>? purchases,
    List<ExchangeStatistic>? exchanges,
    List<SamplingStatistic>? samplings,
  }) {
    return StatisticEntity(
      purchases: purchases ?? this.purchases,
      exchanges: exchanges ?? this.exchanges,
      samplings: samplings ?? this.samplings,
    );
  }

  @override
  String toString() =>
      'StatisticEntity(purchases: $purchases, exchanges: $exchanges, samplings: $samplings)';
}

@embedded
class ExchangeStatistic {
  final Product? product;
  final ProductPackaging? productPackaging;
  final Item? item;
  final int? quantity;

  ExchangeStatistic({
    this.product,
    this.productPackaging,
    this.item,
    this.quantity,
  });

  String toJson() => json.encode(toMap());

  factory ExchangeStatistic.fromJson(String source) =>
      ExchangeStatistic.fromMap(json.decode(source) as Map<String, dynamic>);

  ExchangeStatistic copyWith({
    Product? product,
    ProductPackaging? productPackaging,
    Item? item,
    int? quantity,
  }) {
    return ExchangeStatistic(
      product: product ?? this.product,
      productPackaging: productPackaging ?? this.productPackaging,
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'ExchangeStatistic(product: $product, productPackaging: $productPackaging, item: $item, quantity: $quantity)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'item': item?.toMap(),
      'quantity': quantity,
    };
  }

  factory ExchangeStatistic.fromMap(Map<String, dynamic> map) {
    return ExchangeStatistic(
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
      item: map['item'] != null
          ? Item.fromMap(map['item'] as Map<String, dynamic>)
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  @override
  bool operator ==(covariant ExchangeStatistic other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.productPackaging == productPackaging &&
        other.item == item;
  }

  @override
  int get hashCode {
    return product.hashCode ^ productPackaging.hashCode ^ item.hashCode;
  }
}

@embedded
class PurchaseStatistic {
  final Product? product;
  final ProductPackaging? productPackaging;
  final int? quantity;

  PurchaseStatistic({
    this.product,
    this.productPackaging,
    this.quantity,
  });

  PurchaseStatistic copyWith({
    Product? product,
    ProductPackaging? productPackaging,
    int? quantity,
  }) {
    return PurchaseStatistic(
      product: product ?? this.product,
      productPackaging: productPackaging ?? this.productPackaging,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() =>
      'PurchaseStatistic(product: $product, productPackaging: $productPackaging, quantity: $quantity)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'quantity': quantity,
    };
  }

  factory PurchaseStatistic.fromMap(Map<String, dynamic> map) {
    return PurchaseStatistic(
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseStatistic.fromJson(String source) =>
      PurchaseStatistic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PurchaseStatistic other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.productPackaging == productPackaging;
  }

  @override
  int get hashCode =>
      product.hashCode ^ productPackaging.hashCode ^ quantity.hashCode;
}

@embedded
class SamplingStatistic {
  final Product? product;
  final ProductPackaging? productPackaging;
  final int? quantity;

  SamplingStatistic({
    this.product,
    this.productPackaging,
    this.quantity,
  });

  String toJson() => json.encode(toMap());

  factory SamplingStatistic.fromJson(String source) =>
      SamplingStatistic.fromMap(json.decode(source) as Map<String, dynamic>);

  SamplingStatistic copyWith({
    Product? product,
    ProductPackaging? productPackaging,
    int? quantity,
  }) {
    return SamplingStatistic(
      product: product ?? this.product,
      productPackaging: productPackaging ?? this.productPackaging,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'quantity': quantity,
    };
  }

  factory SamplingStatistic.fromMap(Map<String, dynamic> map) {
    return SamplingStatistic(
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  @override
  bool operator ==(covariant SamplingStatistic other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.productPackaging == productPackaging;
  }

  @override
  int get hashCode => product.hashCode ^ productPackaging.hashCode;
}
