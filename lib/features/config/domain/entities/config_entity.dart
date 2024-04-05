import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';

class ConfigEntity {
  final String versionCode;
  final int versionId;
  final List<Feature> features;

  ConfigEntity({
    required this.versionCode,
    required this.versionId,
    required this.features,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'versionCode': versionCode,
      'versionId': versionId,
      'features': features.map((x) => x.toMap()).toList(),
    };
  }

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    return ConfigEntity(
      versionCode: map['versionCode'] as String,
      versionId: map['versionId'] as int,
      features: List<Feature>.from(
        (map['features'] as List<dynamic>).map<Feature>(
          (x) => Feature.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigEntity.fromJson(String source) =>
      ConfigEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Feature {
  final int id;
  final String name;
  final FeatureType? type;
  final int ordinal;
  final List<dynamic> dependentOnFeatureIds;
  final FeatureAttendance? featureAttendance;
  final List<FeatureQuantity>? featureQuantities;

  Feature({
    required this.id,
    required this.name,
    required this.type,
    required this.ordinal,
    required this.dependentOnFeatureIds,
    this.featureAttendance,
    this.featureQuantities,
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
    };
  }

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      id: map['id'] as int,
      name: map['name'] as String,
      type: (map['type'] as String).toFeatureType(),
      ordinal: map['ordinal'] as int,
      dependentOnFeatureIds:
          List<dynamic>.from(map['dependentOnFeatureIds'] as List<dynamic>),
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Feature.fromJson(String source) =>
      Feature.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FeatureAttendance {
  final int id;
  final bool isPhotoRequired;
  final bool isWatermarkRequired;
  final bool isLocationRequired;
  final dynamic mustWithinRadius;

  FeatureAttendance({
    required this.id,
    required this.isPhotoRequired,
    required this.isWatermarkRequired,
    required this.isLocationRequired,
    required this.mustWithinRadius,
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
      mustWithinRadius: map['mustWithinRadius'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureAttendance.fromJson(String source) =>
      FeatureAttendance.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FeatureQuantity {
  final int id;
  final Item? item;
  final int ordinal;
  final Product? product;
  final ProductPackaging? productPackaging;

  FeatureQuantity({
    required this.id,
    this.item,
    required this.ordinal,
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
}

class Item {
  final int id;
  final String name;
  final String code;
  final String unitName;
  final String itemTypeName;

  Item({
    required this.id,
    required this.name,
    required this.code,
    required this.unitName,
    required this.itemTypeName,
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
}

class Product {
  final int id;
  final String brandName;
  final String name;
  final String code;

  Product({
    required this.id,
    required this.brandName,
    required this.name,
    required this.code,
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
}

class ProductPackaging {
  final int id;
  final String barcode;
  final int price;
  final dynamic rate;
  final String unitName;

  ProductPackaging({
    required this.id,
    required this.barcode,
    required this.price,
    required this.rate,
    required this.unitName,
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
      rate: map['rate'] as dynamic,
      unitName: map['unitName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPackaging.fromJson(String source) =>
      ProductPackaging.fromMap(json.decode(source) as Map<String, dynamic>);
}
