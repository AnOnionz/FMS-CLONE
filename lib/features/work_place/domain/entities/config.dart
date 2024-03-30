// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConfigEntity {
  final String version;
  final List<Config> configs;

  ConfigEntity(
    this.version,
    this.configs,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'configs': configs.map((x) => x.toMap()).toList(),
    };
  }

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    return ConfigEntity(
      map['version'] as String,
      List<Config>.from(
        (map['configs'] as List<dynamic>).map<Config>(
          (x) => Config.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigEntity.fromJson(String source) =>
      ConfigEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConfigEntity(version: $version, configs: $configs)';
}

class Config {
  final int id;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int projectComponentId;
  final int projectId;
  final String name;
  final String type;
  final int ordinal;
  final List<dynamic> dependentOnFeatures;
  final FeatureAttendance? featureAttendance;
  final List<dynamic> featurePhotos;
  final List<dynamic> featureMultimedias;
  final List<dynamic> featureQuantities;
  final dynamic featureOrder;
  final List<dynamic> featureSchemes;
  final List<dynamic> featureCustomers;
  final List<dynamic> featureSamplings;

  Config({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.projectComponentId,
    required this.projectId,
    required this.name,
    required this.type,
    required this.ordinal,
    required this.dependentOnFeatures,
    required this.featureAttendance,
    required this.featurePhotos,
    required this.featureMultimedias,
    required this.featureQuantities,
    required this.featureOrder,
    required this.featureSchemes,
    required this.featureCustomers,
    required this.featureSamplings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'projectComponentId': projectComponentId,
      'projectId': projectId,
      'name': name,
      'type': type,
      'ordinal': ordinal,
      'dependentOnFeatures': dependentOnFeatures,
      'featureAttendance': featureAttendance?.toMap(),
      'featurePhotos': featurePhotos,
      'featureMultimedias': featureMultimedias,
      'featureQuantities': featureQuantities,
      'featureOrder': featureOrder,
      'featureSchemes': featureSchemes,
      'featureCustomers': featureCustomers,
      'featureSamplings': featureSamplings,
    };
  }

  factory Config.fromMap(Map<String, dynamic> map) {
    return Config(
      id: map['id'] as int,
      isActive: map['isActive'] as bool,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      projectComponentId: map['projectComponentId'] as int,
      projectId: map['projectId'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      ordinal: map['ordinal'] as int,
      dependentOnFeatures:
          List<dynamic>.from(map['dependentOnFeatures'] as List<dynamic>),
      featureAttendance: map['featureAttendance'] != null
          ? FeatureAttendance.fromMap(
              map['featureAttendance'] as Map<String, dynamic>)
          : null,
      featurePhotos: List<dynamic>.from(map['featurePhotos'] as List<dynamic>),
      featureMultimedias:
          List<dynamic>.from(map['featureMultimedias'] as List<dynamic>),
      featureQuantities:
          List<dynamic>.from(map['featureQuantities'] as List<dynamic>),
      featureOrder: map['featureOrder'] as dynamic,
      featureSchemes:
          List<dynamic>.from(map['featureSchemes'] as List<dynamic>),
      featureCustomers:
          List<dynamic>.from(map['featureCustomers'] as List<dynamic>),
      featureSamplings:
          List<dynamic>.from(map['featureSamplings'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Config.fromJson(String source) =>
      Config.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Config(id: $id, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, projectComponentId: $projectComponentId, projectId: $projectId, name: $name, type: $type, ordinal: $ordinal, dependentOnFeatures: $dependentOnFeatures, featureAttendance: $featureAttendance, featurePhotos: $featurePhotos, featureMultimedias: $featureMultimedias, featureQuantities: $featureQuantities, featureOrder: $featureOrder, featureSchemes: $featureSchemes, featureCustomers: $featureCustomers, featureSamplings: $featureSamplings)';
  }
}

class FeatureAttendance {
  final int id;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int projectFeatureId;
  final bool isPhotoRequired;
  final bool isWatermarkRequired;
  final bool isLocationRequired;
  final dynamic mustWithinRadius;

  FeatureAttendance({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.projectFeatureId,
    required this.isPhotoRequired,
    required this.isWatermarkRequired,
    required this.isLocationRequired,
    required this.mustWithinRadius,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'projectFeatureId': projectFeatureId,
      'isPhotoRequired': isPhotoRequired,
      'isWatermarkRequired': isWatermarkRequired,
      'isLocationRequired': isLocationRequired,
      'mustWithinRadius': mustWithinRadius,
    };
  }

  factory FeatureAttendance.fromMap(Map<String, dynamic> map) {
    return FeatureAttendance(
      id: map['id'] as int,
      isActive: map['isActive'] as bool,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      projectFeatureId: map['projectFeatureId'] as int,
      isPhotoRequired: map['isPhotoRequired'] as bool,
      isWatermarkRequired: map['isWatermarkRequired'] as bool,
      isLocationRequired: map['isLocationRequired'] as bool,
      mustWithinRadius: map['mustWithinRadius'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureAttendance.fromJson(String source) =>
      FeatureAttendance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeatureAttendance(id: $id, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, projectFeatureId: $projectFeatureId, isPhotoRequired: $isPhotoRequired, isWatermarkRequired: $isWatermarkRequired, isLocationRequired: $isLocationRequired, mustWithinRadius: $mustWithinRadius)';
  }
}
