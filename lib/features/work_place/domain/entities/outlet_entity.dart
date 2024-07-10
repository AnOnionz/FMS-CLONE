import 'dart:convert';

import 'package:fms/core/mixins/fx.dart';
import 'package:isar/isar.dart';

part 'outlet_entity.g.dart';

@embedded
class OutletEntity {
  int? id;
  String? code;
  String? name;
  Province? province;
  District? district;
  Ward? ward;
  String? streetName;
  String? houseNumber;

  OutletEntity({
    this.id,
    this.code,
    this.name,
    this.province,
    this.district,
    this.ward,
    this.streetName,
    this.houseNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'province': province?.toMap(),
      'district': district?.toMap(),
      'ward': ward?.toMap(),
      'streetName': streetName,
      'houseNumber': houseNumber,
    };
  }

  factory OutletEntity.fromMap(Map<String, dynamic> map) {
    return OutletEntity(
      id: map['id'] as int,
      code: map['code'] as String,
      name: map['name'] as String,
      province: map['province'] != null
          ? Province.fromMap(map['province'] as Map<String, dynamic>)
          : null,
      district: map['district'] != null
          ? District.fromMap(map['district'] as Map<String, dynamic>)
          : null,
      ward: map['ward'] != null
          ? Ward.fromMap(map['ward'] as Map<String, dynamic>)
          : null,
      streetName:
          map['streetName'] != null ? map['streetName'] as String : null,
      houseNumber:
          map['houseNumber'] != null ? map['houseNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OutletEntity.fromJson(String source) =>
      OutletEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  String get address {
    return (streetName.isNotEmptyAndNotNull ? '$houseNumber ' : '') +
        (streetName.isNotEmptyAndNotNull ? '$streetName, ' : '') +
        (ward?.name != null ? '${ward!.name}, ' : '') +
        (district?.name != null ? '${district!.name}, ' : '') +
        (province?.name != null ? '${province!.name}' : '');
  }
}

@embedded
class Province {
  int? id;
  String? name;
  Province({this.id, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Province.fromMap(Map<String, dynamic> map) {
    return Province(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) =>
      Province.fromMap(json.decode(source) as Map<String, dynamic>);
}

@embedded
class District {
  int? id;
  int? provinceId;
  String? name;

  District({this.id, this.provinceId, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'provinceId': provinceId,
      'name': name,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['id'] as int,
      provinceId: map['provinceId'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);
}

@embedded
class Ward {
  int? id;
  int? districtId;
  String? name;

  Ward({this.id, this.districtId, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'districtId': districtId,
      'name': name,
    };
  }

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(
      id: map['id'] as int,
      districtId: map['districtId'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ward.fromJson(String source) =>
      Ward.fromMap(json.decode(source) as Map<String, dynamic>);
}
