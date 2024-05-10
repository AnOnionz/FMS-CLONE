// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../general/domain/entities/data_entity.dart';
import '../../../report/domain/entities/photo_entity.dart';

part 'order_entity.g.dart';

@collection
class OrderEntity extends DataEntity {
  Id get isarId => fastHash(dataUuid);
  final String dataUuid;
  final DateTime dataTimestamp;
  final int? attendanceId;
  final int? featureId;
  final List<CustomerInfo>? customerInfos;
  final List<PurchaseEntity>? purchases;
  final List<ExchangeEntity>? exchanges;
  final List<SamplingEntity>? samplings;
  final lcoalPhotos = IsarLinks<PhotoEntity>();
  @ignore
  final List<PhotoEntity>? photos;

  int get totalPrice => (purchases ?? []).fold(
      0,
      (previousValue, element) =>
          previousValue + (element.quantity! * element.orderProduct!.price!));

  OrderEntity(
      {required this.dataUuid,
      required this.dataTimestamp,
      this.attendanceId,
      this.featureId,
      this.customerInfos,
      this.purchases,
      this.exchanges,
      this.samplings,
      this.photos});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.millisecondsSinceEpoch,
      'customerInfos': customerInfos?.map((x) => x.toMap()).toList(),
      'purchases': purchases?.map((x) => x.toMap()).toList(),
      'exchanges': exchanges?.map((x) => x.toMap()).toList(),
      'samplings': samplings?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      customerInfos: map['customerInfos'] != null
          ? List<CustomerInfo>.from(
              (map['customerInfos'] as List<dynamic>).map<CustomerInfo?>(
                (x) => CustomerInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      purchases: map['purchases'] != null
          ? List<PurchaseEntity>.from(
              (map['purchases'] as List<dynamic>).map<PurchaseEntity?>(
                (x) => PurchaseEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      exchanges: map['exchanges'] != null
          ? List<ExchangeEntity>.from(
              (map['exchanges'] as List<dynamic>).map<ExchangeEntity?>(
                (x) => ExchangeEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      samplings: map['samplings'] != null
          ? List<SamplingEntity>.from(
              (map['samplings'] as List<dynamic>).map<SamplingEntity?>(
                (x) => SamplingEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      photos: map['photos'] != null
          ? List<PhotoEntity>.from(
              (map['photos'] as List<dynamic>).map<PhotoEntity?>(
                (x) => PhotoEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'OrderEntity(dataUuid: $dataUuid, dataTimestamp: $dataTimestamp, attendanceId: $attendanceId, featureId: $featureId, customerInfos: $customerInfos, purchases: $purchases, exchanges: $exchanges, samplings: $samplings, photos: $photos)';
  }

  OrderEntity copyWith({
    String? dataUuid,
    DateTime? dataTimestamp,
    int? attendanceId,
    int? featureId,
    List<CustomerInfo>? customerInfos,
    List<PurchaseEntity>? purchases,
    List<ExchangeEntity>? exchanges,
    List<SamplingEntity>? samplings,
    List<PhotoEntity>? photos,
  }) {
    return OrderEntity(
        dataUuid: dataUuid ?? this.dataUuid,
        dataTimestamp: dataTimestamp ?? this.dataTimestamp,
        attendanceId: attendanceId ?? this.attendanceId,
        featureId: featureId ?? this.featureId,
        customerInfos: customerInfos ?? this.customerInfos,
        purchases: purchases ?? this.purchases,
        exchanges: exchanges ?? this.exchanges,
        samplings: samplings ?? this.samplings,
        photos: photos ?? this.photos);
  }

  String toJson() => json.encode(toMap());

  factory OrderEntity.fromJson(String source) =>
      OrderEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

@embedded
class CustomerInfo {
  int? id;
  int? featureCustomerId;
  String? value;
  List<CustomerOption>? options;

  CustomerInfo({
    this.id,
    this.featureCustomerId,
    this.value,
    this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'featureCustomerId': featureCustomerId,
      'value': value,
      'options': options?.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomerInfo.fromMap(Map<String, dynamic> map) {
    return CustomerInfo(
      id: map['id'] != null ? map['id'] as int : null,
      featureCustomerId: map['featureCustomerId'] != null
          ? map['featureCustomerId'] as int
          : null,
      value: map['value'] != null ? map['value'] as String : null,
      options: map['options'] != null
          ? List<CustomerOption>.from(
              (map['options'] as List<dynamic>).map<CustomerOption?>(
                (x) => CustomerOption.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerInfo.fromJson(String source) =>
      CustomerInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerInfo(id: $id, featureCustomerId: $featureCustomerId, value: $value, options: $options)';
  }

  CustomerInfo copyWith({
    int? id,
    int? featureCustomerId,
    String? value,
    List<CustomerOption>? options,
  }) {
    return CustomerInfo(
      id: id ?? this.id,
      featureCustomerId: featureCustomerId ?? this.featureCustomerId,
      value: value ?? this.value,
      options: options ?? this.options,
    );
  }
}

@embedded
class CustomerOption {
  final int? id;
  final int? featureCustomerOptionId;

  CustomerOption({
    this.id,
    this.featureCustomerOptionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'featureCustomerOptionId': featureCustomerOptionId,
    };
  }

  factory CustomerOption.fromMap(Map<String, dynamic> map) {
    return CustomerOption(
      id: map['id'] as int,
      featureCustomerOptionId: map['featureCustomerOptionId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOption.fromJson(String source) =>
      CustomerOption.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerOption(id: $id, featureCustomerOptionId: $featureCustomerOptionId)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerOption &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          featureCustomerOptionId == other.featureCustomerOptionId;

  @override
  int get hashCode => featureCustomerOptionId.hashCode;
}

@embedded
class PurchaseEntity {
  int? id;
  int? featureOrderProductId;
  int? quantity;
  @ignore
  final OrderProduct? orderProduct;

  PurchaseEntity({
    this.id,
    this.featureOrderProductId,
    this.quantity = 0,
    this.orderProduct,
  });

  void updateQuantity(int value) {
    quantity = value;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'featureOrderProductId': featureOrderProductId,
      'quantity': quantity,
    };
  }

  factory PurchaseEntity.fromMap(Map<String, dynamic> map) {
    return PurchaseEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureOrderProductId: map['featureOrderProductId'] != null
          ? map['featureOrderProductId'] as int
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseEntity.fromJson(String source) =>
      PurchaseEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Purchase(id: $id, featureOrderProductId: $featureOrderProductId, quantity: $quantity)';

  PurchaseEntity copyWith({
    int? id,
    int? featureOrderProductId,
    int? quantity,
  }) {
    return PurchaseEntity(
        id: id ?? this.id,
        featureOrderProductId:
            featureOrderProductId ?? this.featureOrderProductId,
        quantity: quantity ?? this.quantity,
        orderProduct: orderProduct);
  }
}

@embedded
class ExchangeEntity {
  final int? id;
  final int? featureSchemeExchangeId;
  final int? quantity;

  ExchangeEntity({
    this.id,
    this.featureSchemeExchangeId,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'featureSchemeExchangeId': featureSchemeExchangeId,
      'quantity': quantity,
    };
  }

  factory ExchangeEntity.fromMap(Map<String, dynamic> map) {
    return ExchangeEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureSchemeExchangeId: map['featureSchemeExchangeId'] != null
          ? map['featureSchemeExchangeId'] as int
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchangeEntity.fromJson(String source) =>
      ExchangeEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExchangeEntity(id: $id, featureSchemeExchangeId: $featureSchemeExchangeId, quantity: $quantity)';

  ExchangeEntity copyWith({
    int? id,
    int? featureSchemeExchangeId,
    int? quantity,
  }) {
    return ExchangeEntity(
      id: id ?? this.id,
      featureSchemeExchangeId:
          featureSchemeExchangeId ?? this.featureSchemeExchangeId,
      quantity: quantity ?? this.quantity,
    );
  }
}

@embedded
class SamplingEntity {
  final int? id;
  final int? featureSamplingId;
  final int? quantity;

  SamplingEntity({
    this.id,
    this.featureSamplingId,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'featureSamplingId': featureSamplingId,
      'quantity': quantity,
    };
  }

  factory SamplingEntity.fromMap(Map<String, dynamic> map) {
    return SamplingEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureSamplingId: map['featureSamplingId'] != null
          ? map['featureSamplingId'] as int
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SamplingEntity.fromJson(String source) =>
      SamplingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SamplingEntity(id: $id, featureSamplingId: $featureSamplingId, quantity: $quantity)';

  SamplingEntity copyWith({
    int? id,
    int? featureSamplingId,
    int? quantity,
  }) {
    return SamplingEntity(
      id: id ?? this.id,
      featureSamplingId: featureSamplingId ?? this.featureSamplingId,
      quantity: quantity ?? this.quantity,
    );
  }
}
