// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:isar/isar.dart';

part 'config_entity.g.dart';

@embedded
class ConfigEntity {
  String? versionCode;
  int? versionId;
  List<FeatureEntity>? features;

  ConfigEntity({
    this.versionCode,
    this.versionId,
    this.features,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'versionCode': versionCode,
      'versionId': versionId,
      'features': features?.map((x) => x.toMap()).toList(),
    };
  }

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    return ConfigEntity(
      versionCode: map['versionCode'] as String,
      versionId: map['versionId'] as int,
      features: List<FeatureEntity>.from(
        (map['features'] as List<dynamic>)
            .map<FeatureEntity>(
              (x) => FeatureEntity.fromMap(x as Map<String, dynamic>),
            )
            .sorted((a, b) => a.ordinal! - b.ordinal!),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigEntity.fromJson(String source) =>
      ConfigEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ConfigEntity(versionCode: $versionCode, versionId: $versionId, features: $features)';
}

@embedded
class FeatureEntity {
  final int? id;
  final String? name;
  @Enumerated(EnumType.name)
  final FeatureType? type;
  final int? ordinal;
  final List<int>? dependentOnFeatureIds;
  final FeatureAttendance? featureAttendance;
  final List<FeatureQuantity>? featureQuantities;
  final List<FeaturePhoto>? featurePhotos;
  final List<FeatureMultimedia>? featureMultimedias;
  final FeatureOrder? featureOrder;
  final List<FeatureScheme>? featureSchemes;
  final List<FeatureCustomer>? featureCustomers;
  final List<FeatureSampling>? featureSamplings;

  FeatureEntity(
      {this.id,
      this.name,
      this.type,
      this.ordinal,
      this.dependentOnFeatureIds,
      this.featureAttendance,
      this.featureQuantities,
      this.featurePhotos,
      this.featureMultimedias,
      this.featureOrder,
      this.featureSchemes,
      this.featureCustomers,
      this.featureSamplings});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'ordinal': ordinal,
      'dependentOnFeatureIds': dependentOnFeatureIds,
      'featureAttendance': featureAttendance?.toMap(),
      'featureQuantities': featureQuantities?.map((x) => x.toMap()).toList(),
      'featurePhotos': featurePhotos?.map((x) => x.toMap()).toList(),
      'featureMultimedias': featureMultimedias?.map((x) => x.toMap()).toList(),
      'featureOrder': featureOrder?.toMap(),
      'featureSchemes': featureSchemes?.map((x) => x.toMap()).toList(),
      'featureCustomers': featureCustomers?.map((x) => x.toMap()).toList(),
      'featureSamplings': featureSamplings?.map((x) => x.toMap()).toList(),
    };
  }

  factory FeatureEntity.fromMap(Map<String, dynamic> map) {
    return FeatureEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      type: (map['type'] as String).toFeatureType(),
      ordinal: map['ordinal'] as int,
      dependentOnFeatureIds:
          List<int>.from(map['dependentOnFeatureIds'] as List<dynamic>),
      featureAttendance: map['featureAttendance'] != null
          ? FeatureAttendance.fromMap(
              map['featureAttendance'] as Map<String, dynamic>)
          : null,
      featureQuantities: map['featureQuantities'] != null
          ? List<FeatureQuantity>.from(
              (map['featureQuantities'] as List<dynamic>).map<FeatureQuantity?>(
                (x) => FeatureQuantity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      featurePhotos: map['featurePhotos'] != null
          ? List<FeaturePhoto>.from(
              (map['featurePhotos'] as List<dynamic>).map<FeaturePhoto?>(
                (x) => FeaturePhoto.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      featureMultimedias: map['featureMultimedias'] != null
          ? List<FeatureMultimedia>.from(
              (map['featureMultimedias'] as List<dynamic>)
                  .map<FeatureMultimedia?>(
                (x) => FeatureMultimedia.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      featureOrder: map['featureOrder'] != null
          ? FeatureOrder.fromMap(map['featureOrder'] as Map<String, dynamic>)
          : null,
      featureSchemes: map['featureSchemes'] != null
          ? List<FeatureScheme>.from(
              (map['featureSchemes'] as List<dynamic>).map<FeatureScheme?>(
                (x) => FeatureScheme.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      featureCustomers: map['featureCustomers'] != null
          ? List<FeatureCustomer>.from(
              (map['featureCustomers'] as List<dynamic>).map<FeatureCustomer?>(
                (x) => FeatureCustomer.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      featureSamplings: map['featureSamplings'] != null
          ? List<FeatureSampling>.from(
              (map['featureSamplings'] as List<dynamic>).map<FeatureSampling?>(
                (x) => FeatureSampling.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureEntity.fromJson(String source) =>
      FeatureEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  FeatureEntity copyWith({
    int? id,
    String? name,
    FeatureType? type,
    int? ordinal,
    List<int>? dependentOnFeatureIds,
    FeatureAttendance? featureAttendance,
    List<FeatureQuantity>? featureQuantities,
    List<FeaturePhoto>? featurePhotos,
    List<FeatureMultimedia>? featureMultimedias,
  }) {
    return FeatureEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      ordinal: ordinal ?? this.ordinal,
      dependentOnFeatureIds:
          dependentOnFeatureIds ?? this.dependentOnFeatureIds,
      featureAttendance: featureAttendance ?? this.featureAttendance,
      featureQuantities: featureQuantities ?? this.featureQuantities,
      featurePhotos: featurePhotos ?? this.featurePhotos,
      featureMultimedias: featureMultimedias ?? this.featureMultimedias,
    );
  }

  @override
  String toString() {
    return 'FeatureEntity(id: $id, name: $name, type: $type, ordinal: $ordinal, dependentOnFeatureIds: $dependentOnFeatureIds, featureAttendance: $featureAttendance, featureQuantities: $featureQuantities, featurePhotos: $featurePhotos, featureMultimedias: $featureMultimedias, featureOrder: $featureOrder, featureSchemes: $featureSchemes, featureCustomers: $featureCustomers, featureSamplings: $featureSamplings)';
  }
}

class EmbeddedFeatureEntity extends FeatureEntity {
  final String? name;
  final FeatureType? type;
  final int? ordinal;
  final List<int>? dependentOnFeatureIds;
  final FeatureEntity feature;

  EmbeddedFeatureEntity(
      {required this.feature,
      this.name,
      this.type,
      this.ordinal,
      this.dependentOnFeatureIds});
}

@embedded
class FeatureAttendance {
  final int? id;
  final bool? isPhotoRequired;
  final bool? isWatermarkRequired;
  final bool? isLocationRequired;
  final double? mustWithinRadius;
  final bool? isFaceRequired;

  FeatureAttendance({
    this.id,
    this.isPhotoRequired,
    this.isWatermarkRequired,
    this.isLocationRequired,
    this.mustWithinRadius,
    this.isFaceRequired,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isPhotoRequired': isPhotoRequired,
      'isWatermarkRequired': isWatermarkRequired,
      'isLocationRequired': isLocationRequired,
      'mustWithinRadius': mustWithinRadius,
      'isFaceRequired': isFaceRequired,
    };
  }

  factory FeatureAttendance.fromMap(Map<String, dynamic> map) {
    return FeatureAttendance(
      id: map['id'] != null ? map['id'] as int : null,
      isPhotoRequired: map['isPhotoRequired'] != null
          ? map['isPhotoRequired'] as bool
          : null,
      isWatermarkRequired: map['isWatermarkRequired'] != null
          ? map['isWatermarkRequired'] as bool
          : null,
      isLocationRequired: map['isLocationRequired'] != null
          ? map['isLocationRequired'] as bool
          : null,
      mustWithinRadius: map['mustWithinRadius'] != null
          ? map['mustWithinRadius'] as double
          : null,
      isFaceRequired:
          map['isFaceRequired'] != null ? map['isFaceRequired'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureAttendance.fromJson(String source) =>
      FeatureAttendance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureAttendance(id: $id, isPhotoRequired: $isPhotoRequired, isWatermarkRequired: $isWatermarkRequired, isLocationRequired: $isLocationRequired, mustWithinRadius: $mustWithinRadius, isFaceRequired: $isFaceRequired)';
  }
}

@embedded
class FeatureQuantity {
  final int? id;
  final Item? item;
  final int? ordinal;
  final Product? product;
  final ProductPackaging? productPackaging;

  FeatureQuantity({
    this.id,
    this.item,
    this.ordinal,
    this.product,
    this.productPackaging,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'item': item?.toMap(),
      'ordinal': ordinal,
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
    };
  }

  factory FeatureQuantity.fromMap(Map<String, dynamic> map) {
    return FeatureQuantity(
      id: map['id'] as int,
      item: map['item'] != null
          ? Item.fromMap(map['item'] as Map<String, dynamic>)
          : null,
      ordinal: map['ordinal'] as int,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureQuantity.fromJson(String source) =>
      FeatureQuantity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureQuantity(id: $id, item: $item, ordinal: $ordinal, product: $product, productPackaging: $productPackaging)';
  }
}

@embedded
class FeaturePhoto {
  final int? id;
  final int? ordinal;
  final String? name;
  final String? description;
  final int? minimum;
  final int? maximum;
  final bool? isWatermarkRequired;

  FeaturePhoto({
    this.id,
    this.ordinal,
    this.name,
    this.description,
    this.minimum,
    this.maximum,
    this.isWatermarkRequired,
  });

  bool get isRequired => (minimum ?? 0) > 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ordinal': ordinal,
      'name': name,
      'description': description,
      'minimum': minimum,
      'maximum': maximum,
      'isWatermarkRequired': isWatermarkRequired,
    };
  }

  factory FeaturePhoto.fromMap(Map<String, dynamic> map) {
    return FeaturePhoto(
      id: map['id'] as int,
      ordinal: map['ordinal'] as int,
      name: map['name'] as String,
      description: map['description'] as String?,
      minimum: map['minimum'] as int,
      maximum: map['maximum'] as int,
      isWatermarkRequired: map['isWatermarkRequired'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeaturePhoto.fromJson(String source) =>
      FeaturePhoto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeaturePhoto(id: $id, ordinal: $ordinal, name: $name, description: $description, minimum: $minimum, maximum: $maximum, isWatermarkRequired: $isWatermarkRequired)';
  }
}

@embedded
class FeatureMultimedia {
  final int? id;
  final int? ordinal;
  final String? title;
  final String? description;
  final int? minimumImages;
  final int? maximumImages;
  final bool? isWatermarkRequired;
  final bool? isTextFieldRequired;

  FeatureMultimedia({
    this.id,
    this.ordinal,
    this.title,
    this.description,
    this.minimumImages,
    this.maximumImages,
    this.isWatermarkRequired,
    this.isTextFieldRequired,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ordinal': ordinal,
      'title': title,
      'description': description,
      'minimumImages': minimumImages,
      'maximumImages': maximumImages,
      'isWatermarkRequired': isWatermarkRequired,
      'isTextFieldRequired': isTextFieldRequired,
    };
  }

  factory FeatureMultimedia.fromMap(Map<String, dynamic> map) {
    return FeatureMultimedia(
      id: map['id'] != null ? map['id'] as int : null,
      ordinal: map['ordinal'] != null ? map['ordinal'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      minimumImages:
          map['minimumImages'] != null ? map['minimumImages'] as int : null,
      maximumImages:
          map['maximumImages'] != null ? map['maximumImages'] as int : null,
      isWatermarkRequired: map['isWatermarkRequired'] != null
          ? map['isWatermarkRequired'] as bool
          : null,
      isTextFieldRequired: map['isTextFieldRequired'] != null
          ? map['isTextFieldRequired'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureMultimedia.fromJson(String source) =>
      FeatureMultimedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureMultimedia(id: $id, ordinal: $ordinal, title: $title, description: $description, minimumImages: $minimumImages, maximumImages: $maximumImages, isWatermarkRequired: $isWatermarkRequired, isTextFieldRequired: $isTextFieldRequired)';
  }
}

@embedded
class FeatureOrder {
  final int? id;
  final bool? hasPurchase;
  final bool? hasExchange;
  final bool? hasCustomer;
  final bool? hasPhoto;
  final bool? hasSampling;
  final bool? isCustomerRequired;
  final List<OrderProduct>? products;

  FeatureOrder({
    this.id,
    this.hasPurchase,
    this.hasExchange,
    this.hasCustomer,
    this.hasPhoto,
    this.hasSampling,
    this.isCustomerRequired,
    this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hasPurchase': hasPurchase,
      'hasExchange': hasExchange,
      'hasCustomer': hasCustomer,
      'hasPhoto': hasPhoto,
      'hasSampling': hasSampling,
      'isCustomerRequired': isCustomerRequired,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory FeatureOrder.fromMap(Map<String, dynamic> map) {
    return FeatureOrder(
      id: map['id'] != null ? map['id'] as int : null,
      hasPurchase:
          map['hasPurchase'] != null ? map['hasPurchase'] as bool : null,
      hasExchange:
          map['hasExchange'] != null ? map['hasExchange'] as bool : null,
      hasCustomer:
          map['hasCustomer'] != null ? map['hasCustomer'] as bool : null,
      hasPhoto: map['hasPhoto'] != null ? map['hasPhoto'] as bool : null,
      hasSampling:
          map['hasSampling'] != null ? map['hasSampling'] as bool : null,
      isCustomerRequired: map['isCustomerRequired'] != null
          ? map['isCustomerRequired'] as bool
          : null,
      products: map['products'] != null
          ? List<OrderProduct>.from(
              (map['products'] as List<dynamic>).map<OrderProduct?>(
                (x) => OrderProduct.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureOrder.fromJson(String source) =>
      FeatureOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureOrder(id: $id, hasPurchase: $hasPurchase, hasExchange: $hasExchange, hasCustomer: $hasCustomer, hasPhoto: $hasPhoto, hasSampling: $hasSampling, isCustomerRequired: $isCustomerRequired, products: $products)';
  }
}

@embedded
class FeatureScheme {
  final int? id;
  final String? name;
  final String? description;
  final List<Exchange>? exchanges;

  FeatureScheme({
    this.id,
    this.name,
    this.description,
    this.exchanges,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'exchanges': exchanges?.map((x) => x.toMap()).toList(),
    };
  }

  factory FeatureScheme.fromMap(Map<String, dynamic> map) {
    return FeatureScheme(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      exchanges: map['exchanges'] != null
          ? List<Exchange>.from(
              (map['exchanges'] as List<dynamic>).map<Exchange?>(
                (x) => Exchange.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureScheme.fromJson(String source) =>
      FeatureScheme.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureScheme(id: $id, name: $name, description: $description, exchanges: $exchanges)';
  }
}

@embedded
class FeatureCustomer {
  final int? id;
  final String? name;
  final String? description;
  final int? ordinal;
  final String? dataType;
  final bool? isIdentity;
  final bool? isRequired;
  final List<Option>? options;

  FeatureCustomer({
    this.id,
    this.name,
    this.description,
    this.ordinal,
    this.dataType,
    this.isIdentity,
    this.isRequired,
    this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'ordinal': ordinal,
      'dataType': dataType,
      'isIdentity': isIdentity,
      'isRequired': isRequired,
      'options': options?.map((x) => x.toMap()).toList(),
    };
  }

  factory FeatureCustomer.fromMap(Map<String, dynamic> map) {
    return FeatureCustomer(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      ordinal: map['ordinal'] != null ? map['ordinal'] as int : null,
      dataType: map['dataType'] != null ? map['dataType'] as String : null,
      isIdentity: map['isIdentity'] != null ? map['isIdentity'] as bool : null,
      isRequired: map['isRequired'] != null ? map['isRequired'] as bool : null,
      options: map['options'] != null
          ? List<Option>.from(
              (map['options'] as List<dynamic>).map<Option?>(
                (x) => Option.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureCustomer.fromJson(String source) =>
      FeatureCustomer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureCustomer(id: $id, name: $name, description: $description, ordinal: $ordinal, dataType: $dataType, isIdentity: $isIdentity, isRequired: $isRequired, options: $options)';
  }
}

@embedded
class FeatureSampling {
  final int? id;
  final Unit? unit;
  final int? numerator;
  final int? denominator;
  final Product? product;
  final ProductPackaging? productPackaging;
  final int? ordinal;

  FeatureSampling({
    this.id,
    this.unit,
    this.numerator,
    this.denominator,
    this.product,
    this.productPackaging,
    this.ordinal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'unit': unit?.toMap(),
      'numerator': numerator,
      'denominator': denominator,
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'ordinal': ordinal,
    };
  }

  factory FeatureSampling.fromMap(Map<String, dynamic> map) {
    return FeatureSampling(
      id: map['id'] != null ? map['id'] as int : null,
      unit: map['unit'] != null
          ? Unit.fromMap(map['unit'] as Map<String, dynamic>)
          : null,
      numerator: map['numerator'] != null ? map['numerator'] as int : null,
      denominator:
          map['denominator'] != null ? map['denominator'] as int : null,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
      ordinal: map['ordinal'] != null ? map['ordinal'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureSampling.fromJson(String source) =>
      FeatureSampling.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureSampling(id: $id, unit: $unit, numerator: $numerator, denominator: $denominator, product: $product, productPackaging: $productPackaging, ordinal: $ordinal)';
  }

  FeatureSampling copyWith({
    int? id,
    Unit? unit,
    int? numerator,
    int? denominator,
    Product? product,
    ProductPackaging? productPackaging,
    int? ordinal,
  }) {
    return FeatureSampling(
      id: id ?? this.id,
      unit: unit ?? this.unit,
      numerator: numerator ?? this.numerator,
      denominator: denominator ?? this.denominator,
      product: product ?? this.product,
      productPackaging: productPackaging ?? this.productPackaging,
      ordinal: ordinal ?? this.ordinal,
    );
  }

  @override
  bool operator ==(covariant FeatureSampling other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.unit == unit &&
        other.numerator == numerator &&
        other.denominator == denominator &&
        other.product == product &&
        other.productPackaging == productPackaging &&
        other.ordinal == ordinal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        unit.hashCode ^
        numerator.hashCode ^
        denominator.hashCode ^
        product.hashCode ^
        productPackaging.hashCode ^
        ordinal.hashCode;
  }
}

@embedded
class Exchange {
  final int? id;
  final int? maxReceiveQuantity;
  final int? reachAmount;
  final bool? hasPlayedGame;
  final String? logical;
  final List<ExchangeCondition>? exchangeConditions;
  final List<ExchangeProceed>? exchangeProceeds;

  Exchange({
    this.id,
    this.maxReceiveQuantity,
    this.reachAmount,
    this.logical,
    this.hasPlayedGame,
    this.exchangeConditions,
    this.exchangeProceeds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'maxReceiveQuantity': maxReceiveQuantity,
      'reachAmount': reachAmount,
      'logical': logical,
      'hasPlayedGame': hasPlayedGame,
      'exchangeConditions': exchangeConditions?.map((x) => x.toMap()).toList(),
      'exchangeProceeds': exchangeProceeds?.map((x) => x.toMap()).toList(),
    };
  }

  factory Exchange.fromMap(Map<String, dynamic> map) {
    return Exchange(
      id: map['id'] != null ? map['id'] as int : null,
      maxReceiveQuantity: map['maxReceiveQuantity'] != null
          ? map['maxReceiveQuantity'] as int
          : null,
      hasPlayedGame:
          map['hasPlayedGame'] != null ? map['hasPlayedGame'] as bool : null,
      reachAmount:
          map['reachAmount'] != null ? map['reachAmount'] as int : null,
      logical: map['logical'] != null ? map['logical'] as String : null,
      exchangeConditions: map['exchangeConditions'] != null
          ? List<ExchangeCondition>.from(
              (map['exchangeConditions'] as List<dynamic>)
                  .map<ExchangeCondition?>(
                (x) => ExchangeCondition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      exchangeProceeds: map['exchangeProceeds'] != null
          ? List<ExchangeProceed>.from(
              (map['exchangeProceeds'] as List<dynamic>).map<ExchangeProceed?>(
                (x) => ExchangeProceed.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exchange.fromJson(String source) =>
      Exchange.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exchange(id: $id, maxReceiveQuantity: $maxReceiveQuantity, reachAmount: $reachAmount, logical: $logical, exchangeConditions: $exchangeConditions, exchangeProceeds: $exchangeProceeds)';
  }

  Exchange copyWith({
    int? id,
    int? maxReceiveQuantity,
    int? reachAmount,
    String? logical,
    List<ExchangeCondition>? exchangeConditions,
    List<ExchangeProceed>? exchangeProceeds,
  }) {
    return Exchange(
      id: id ?? this.id,
      maxReceiveQuantity: maxReceiveQuantity ?? this.maxReceiveQuantity,
      reachAmount: reachAmount ?? this.reachAmount,
      logical: logical ?? this.logical,
      hasPlayedGame: this.hasPlayedGame,
      exchangeConditions: exchangeConditions ?? this.exchangeConditions,
      exchangeProceeds: exchangeProceeds ?? this.exchangeProceeds,
    );
  }
}

@embedded
class ExchangeCondition {
  final int? id;
  final Product? product;
  final ProductPackaging? productPackaging;
  final int? quantity;

  ExchangeCondition({
    this.id,
    this.product,
    this.productPackaging,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'quantity': quantity,
    };
  }

  factory ExchangeCondition.fromMap(Map<String, dynamic> map) {
    return ExchangeCondition(
      id: map['id'] != null ? map['id'] as int : null,
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

  factory ExchangeCondition.fromJson(String source) =>
      ExchangeCondition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExchangeCondition(id: $id, product: $product, productPackaging: $productPackaging, quantity: $quantity)';
  }

  ExchangeCondition copyWith({
    int? id,
    Product? product,
    ProductPackaging? productPackaging,
    int? quantity,
  }) {
    return ExchangeCondition(
      id: id ?? this.id,
      product: product ?? this.product,
      productPackaging: productPackaging ?? this.productPackaging,
      quantity: quantity ?? this.quantity,
    );
  }
}

@embedded
class ExchangeProceed {
  final int? id;
  final Product? product;
  final ProductPackaging? productPackaging;
  final Item? item;
  final int? quantity;
  final bool? hasPlayedGame;

  ExchangeProceed({
    this.id,
    this.product,
    this.productPackaging,
    this.item,
    this.quantity,
    this.hasPlayedGame = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'item': item?.toMap(),
      'quantity': quantity,
    };
  }

  factory ExchangeProceed.fromMap(Map<String, dynamic> map) {
    return ExchangeProceed(
      id: map['id'] != null ? map['id'] as int : null,
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

  String toJson() => json.encode(toMap());

  factory ExchangeProceed.fromJson(String source) =>
      ExchangeProceed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExchangeProceed(id: $id, product: $product, productPackaging: $productPackaging, item: $item, quantity: $quantity)';
  }

  ExchangeProceed copyWith({
    int? id,
    Product? product,
    ProductPackaging? productPackaging,
    Item? item,
    int? quantity,
    bool? hasPlayedGame,
  }) {
    return ExchangeProceed(
        id: id ?? this.id,
        product: product ?? this.product,
        productPackaging: productPackaging ?? this.productPackaging,
        item: item ?? this.item,
        quantity: quantity ?? this.quantity,
        hasPlayedGame: hasPlayedGame ?? this.hasPlayedGame);
  }
}

@embedded
class Option {
  final int? id;
  final String? name;
  @ignore
  bool isChecked;
  Option({this.id, this.name, this.isChecked = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) =>
      Option.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Option(id: $id, name: $name)';
}

@embedded
class Item {
  final int? id;
  final String? name;
  final String? code;
  final String? unitName;
  final String? itemTypeName;
  final String? imageUrl;

  Item(
      {this.id,
      this.name,
      this.code,
      this.unitName,
      this.itemTypeName,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'unitName': unitName,
      'itemTypeName': itemTypeName,
      'imageUrl': imageUrl
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'] as int,
        name: map['name'] as String,
        code: map['code'] as String,
        unitName: map['unitName'] as String,
        itemTypeName: map['itemTypeName'] as String,
        imageUrl: map['imageUrl'] as String?);
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, code: $code, unitName: $unitName, itemTypeName: $itemTypeName)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => name.hashCode;
}

@embedded
class Product {
  final int? id;
  final String? brandName;
  final String? imageUrl;
  final String? name;
  final String? code;

  Product({
    this.id,
    this.brandName,
    this.imageUrl,
    this.name,
    this.code,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandName': brandName,
      'imageUrl': imageUrl,
      'name': name,
      'code': code,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      brandName: map['brandName'] as String,
      imageUrl: map['imageUrl'] as String?,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, brandName: $brandName, imageUrl: $imageUrl, name: $name, code: $code)';
  }
}

@embedded
class ProductPackaging {
  final int? id;
  final String? barcode;
  final int? price;
  final int? rate;
  final Unit? unit;
  final String? unitName;

  ProductPackaging({
    this.id,
    this.barcode,
    this.price,
    this.rate,
    this.unit,
    this.unitName,
  });

  @override
  bool operator ==(covariant ProductPackaging other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.barcode == barcode &&
        other.price == price &&
        other.rate == rate &&
        other.unit == unit &&
        other.unitName == unitName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        barcode.hashCode ^
        price.hashCode ^
        rate.hashCode ^
        unit.hashCode ^
        unitName.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'barcode': barcode,
      'price': price,
      'rate': rate,
      'unit': unit?.toMap(),
      'unitName': unitName,
    };
  }

  factory ProductPackaging.fromMap(Map<String, dynamic> map) {
    return ProductPackaging(
      id: map['id'] != null ? map['id'] as int : null,
      barcode: map['barcode'] != null ? map['barcode'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      unit: map['unit'] != null
          ? Unit.fromMap(map['unit'] as Map<String, dynamic>)
          : null,
      unitName: map['unitName'] != null ? map['unitName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPackaging.fromJson(String source) =>
      ProductPackaging.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductPackaging(id: $id, barcode: $barcode, price: $price, rate: $rate, unit: $unit, unitName: $unitName)';
  }

  ProductPackaging copyWith({
    int? id,
    String? barcode,
    int? price,
    int? rate,
    Unit? unit,
    String? unitName,
  }) {
    return ProductPackaging(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      unit: unit ?? this.unit,
      unitName: unitName ?? this.unitName,
    );
  }
}

@embedded
class Unit {
  final int? id;
  final String? name;
  final String? description;

  Unit({
    this.id,
    this.name,
    this.description,
  });

  Unit copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) =>
      Unit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Unit(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant Unit other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}

@embedded
class OrderProduct {
  final int? id;
  final Product? product;
  final ProductPackaging? productPackaging;
  final int? price;

  OrderProduct({
    this.id,
    this.product,
    this.productPackaging,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product?.toMap(),
      'productPackaging': productPackaging?.toMap(),
      'price': price,
    };
  }

  factory OrderProduct.fromMap(Map<String, dynamic> map) {
    return OrderProduct(
      id: map['id'] != null ? map['id'] as int : null,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      productPackaging: map['productPackaging'] != null
          ? ProductPackaging.fromMap(
              map['productPackaging'] as Map<String, dynamic>)
          : null,
      price: map['price'] != null ? map['price'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProduct.fromJson(String source) =>
      OrderProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderProduct &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'OrderProduct(id: $id, product: $product, productPackaging: $productPackaging, price: $price)';
  }
}
