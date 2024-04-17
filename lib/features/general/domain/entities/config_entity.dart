// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';

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

  FeatureEntity({
    this.id,
    this.name,
    this.type,
    this.ordinal,
    this.dependentOnFeatureIds,
    this.featureAttendance,
    this.featureQuantities,
    this.featurePhotos,
  });

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
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureEntity.fromJson(String source) =>
      FeatureEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureEntity(id: $id, name: $name, type: $type, ordinal: $ordinal, dependentOnFeatureIds: $dependentOnFeatureIds, featureAttendance: $featureAttendance, featureQuantities: $featureQuantities, featurePhotos: $featurePhotos)';
  }

  FeatureEntity copyWith({
    int? id,
    String? name,
    FeatureType? type,
    int? ordinal,
    List<int>? dependentOnFeatureIds,
    FeatureAttendance? featureAttendance,
    List<FeatureQuantity>? featureQuantities,
    List<FeaturePhoto>? featurePhotos,
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
    );
  }
}

@embedded
class FeatureAttendance {
  final int? id;
  final bool? isPhotoRequired;
  final bool? isWatermarkRequired;
  final bool? isLocationRequired;
  final double? mustWithinRadius;

  FeatureAttendance({
    this.id,
    this.isPhotoRequired,
    this.isWatermarkRequired,
    this.isLocationRequired,
    this.mustWithinRadius,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isPhotoRequired': isPhotoRequired,
      'isWatermarkRequired': isWatermarkRequired,
      'isLocationRequired': isLocationRequired,
      'mustWithinRadius': mustWithinRadius,
    };
  }

  factory FeatureAttendance.fromMap(Map<String, dynamic> map) {
    return FeatureAttendance(
      id: map['id'] as int,
      isPhotoRequired: map['isPhotoRequired'] as bool,
      isWatermarkRequired: map['isWatermarkRequired'] as bool,
      isLocationRequired: map['isLocationRequired'] as bool,
      mustWithinRadius: map['mustWithinRadius'] as double?,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureAttendance.fromJson(String source) =>
      FeatureAttendance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureAttendance(id: $id, isPhotoRequired: $isPhotoRequired, isWatermarkRequired: $isWatermarkRequired, isLocationRequired: $isLocationRequired, mustWithinRadius: $mustWithinRadius)';
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
class Item {
  final int? id;
  final String? name;
  final String? code;
  final String? unitName;
  final String? itemTypeName;

  Item({
    this.id,
    this.name,
    this.code,
    this.unitName,
    this.itemTypeName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'unitName': unitName,
      'itemTypeName': itemTypeName,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
      unitName: map['unitName'] as String,
      itemTypeName: map['itemTypeName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, code: $code, unitName: $unitName, itemTypeName: $itemTypeName)';
  }
}

@embedded
class Product {
  final int? id;
  final String? brandName;
  final String? name;
  final String? code;

  Product({
    this.id,
    this.brandName,
    this.name,
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandName': brandName,
      'name': name,
      'code': code,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      brandName: map['brandName'] as String,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, brandName: $brandName, name: $name, code: $code)';
  }
}

@embedded
class ProductPackaging {
  final int? id;
  final String? barcode;
  final int? price;
  final int? rate;
  final String? unitName;

  ProductPackaging({
    this.id,
    this.barcode,
    this.price,
    this.rate,
    this.unitName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'barcode': barcode,
      'price': price,
      'rate': rate,
      'unitName': unitName,
    };
  }

  factory ProductPackaging.fromMap(Map<String, dynamic> map) {
    return ProductPackaging(
      id: map['id'] as int,
      barcode: map['barcode'] as String,
      price: map['price'] as int,
      rate: map['rate'] as int?,
      unitName: map['unitName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPackaging.fromJson(String source) =>
      ProductPackaging.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductPackaging(id: $id, barcode: $barcode, price: $price, rate: $rate, unitName: $unitName)';
  }
}
