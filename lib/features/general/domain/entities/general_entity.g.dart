// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGeneralEntityCollection on Isar {
  IsarCollection<GeneralEntity> get generalEntitys => this.collection();
}

const GeneralEntitySchema = CollectionSchema(
  name: r'GeneralEntity',
  id: 7965206913433058300,
  properties: {
    r'attendance': PropertySchema(
      id: 0,
      name: r'attendance',
      type: IsarType.object,
      target: r'AttendanceEntity',
    ),
    r'booth': PropertySchema(
      id: 1,
      name: r'booth',
      type: IsarType.object,
      target: r'BoothEntity',
    ),
    r'config': PropertySchema(
      id: 2,
      name: r'config',
      type: IsarType.object,
      target: r'ConfigEntity',
    ),
    r'outlet': PropertySchema(
      id: 3,
      name: r'outlet',
      type: IsarType.object,
      target: r'OutletEntity',
    ),
    r'project': PropertySchema(
      id: 4,
      name: r'project',
      type: IsarType.object,
      target: r'ProjectEntity',
    )
  },
  estimateSize: _generalEntityEstimateSize,
  serialize: _generalEntitySerialize,
  deserialize: _generalEntityDeserialize,
  deserializeProp: _generalEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ProjectEntity': ProjectEntitySchema,
    r'OutletEntity': OutletEntitySchema,
    r'Province': ProvinceSchema,
    r'District': DistrictSchema,
    r'Ward': WardSchema,
    r'BoothEntity': BoothEntitySchema,
    r'ConfigEntity': ConfigEntitySchema,
    r'FeatureEntity': FeatureEntitySchema,
    r'FeatureAttendance': FeatureAttendanceSchema,
    r'FeatureQuantity': FeatureQuantitySchema,
    r'Item': ItemSchema,
    r'Product': ProductSchema,
    r'ProductPackaging': ProductPackagingSchema,
    r'FeaturePhoto': FeaturePhotoSchema,
    r'AttendanceEntity': AttendanceEntitySchema,
    r'AttendanceData': AttendanceDataSchema,
    r'ImageCloud': ImageCloudSchema
  },
  getId: _generalEntityGetId,
  getLinks: _generalEntityGetLinks,
  attach: _generalEntityAttach,
  version: '3.1.0+1',
);

int _generalEntityEstimateSize(
  GeneralEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attendance;
    if (value != null) {
      bytesCount += 3 +
          AttendanceEntitySchema.estimateSize(
              value, allOffsets[AttendanceEntity]!, allOffsets);
    }
  }
  bytesCount += 3 +
      BoothEntitySchema.estimateSize(
          object.booth, allOffsets[BoothEntity]!, allOffsets);
  bytesCount += 3 +
      ConfigEntitySchema.estimateSize(
          object.config, allOffsets[ConfigEntity]!, allOffsets);
  bytesCount += 3 +
      OutletEntitySchema.estimateSize(
          object.outlet, allOffsets[OutletEntity]!, allOffsets);
  bytesCount += 3 +
      ProjectEntitySchema.estimateSize(
          object.project, allOffsets[ProjectEntity]!, allOffsets);
  return bytesCount;
}

void _generalEntitySerialize(
  GeneralEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AttendanceEntity>(
    offsets[0],
    allOffsets,
    AttendanceEntitySchema.serialize,
    object.attendance,
  );
  writer.writeObject<BoothEntity>(
    offsets[1],
    allOffsets,
    BoothEntitySchema.serialize,
    object.booth,
  );
  writer.writeObject<ConfigEntity>(
    offsets[2],
    allOffsets,
    ConfigEntitySchema.serialize,
    object.config,
  );
  writer.writeObject<OutletEntity>(
    offsets[3],
    allOffsets,
    OutletEntitySchema.serialize,
    object.outlet,
  );
  writer.writeObject<ProjectEntity>(
    offsets[4],
    allOffsets,
    ProjectEntitySchema.serialize,
    object.project,
  );
}

GeneralEntity _generalEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeneralEntity(
    attendance: reader.readObjectOrNull<AttendanceEntity>(
      offsets[0],
      AttendanceEntitySchema.deserialize,
      allOffsets,
    ),
    booth: reader.readObjectOrNull<BoothEntity>(
          offsets[1],
          BoothEntitySchema.deserialize,
          allOffsets,
        ) ??
        BoothEntity(),
    config: reader.readObjectOrNull<ConfigEntity>(
          offsets[2],
          ConfigEntitySchema.deserialize,
          allOffsets,
        ) ??
        ConfigEntity(),
    outlet: reader.readObjectOrNull<OutletEntity>(
          offsets[3],
          OutletEntitySchema.deserialize,
          allOffsets,
        ) ??
        OutletEntity(),
    project: reader.readObjectOrNull<ProjectEntity>(
          offsets[4],
          ProjectEntitySchema.deserialize,
          allOffsets,
        ) ??
        ProjectEntity(),
  );
  return object;
}

P _generalEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AttendanceEntity>(
        offset,
        AttendanceEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<BoothEntity>(
            offset,
            BoothEntitySchema.deserialize,
            allOffsets,
          ) ??
          BoothEntity()) as P;
    case 2:
      return (reader.readObjectOrNull<ConfigEntity>(
            offset,
            ConfigEntitySchema.deserialize,
            allOffsets,
          ) ??
          ConfigEntity()) as P;
    case 3:
      return (reader.readObjectOrNull<OutletEntity>(
            offset,
            OutletEntitySchema.deserialize,
            allOffsets,
          ) ??
          OutletEntity()) as P;
    case 4:
      return (reader.readObjectOrNull<ProjectEntity>(
            offset,
            ProjectEntitySchema.deserialize,
            allOffsets,
          ) ??
          ProjectEntity()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _generalEntityGetId(GeneralEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _generalEntityGetLinks(GeneralEntity object) {
  return [];
}

void _generalEntityAttach(
    IsarCollection<dynamic> col, Id id, GeneralEntity object) {}

extension GeneralEntityQueryWhereSort
    on QueryBuilder<GeneralEntity, GeneralEntity, QWhere> {
  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GeneralEntityQueryWhere
    on QueryBuilder<GeneralEntity, GeneralEntity, QWhereClause> {
  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterWhereClause> isarIdBetween(
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

extension GeneralEntityQueryFilter
    on QueryBuilder<GeneralEntity, GeneralEntity, QFilterCondition> {
  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
      attendanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendance',
      ));
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
      attendanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendance',
      ));
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
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

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition>
      isarIdBetween(
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
}

extension GeneralEntityQueryObject
    on QueryBuilder<GeneralEntity, GeneralEntity, QFilterCondition> {
  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition> attendance(
      FilterQuery<AttendanceEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'attendance');
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition> booth(
      FilterQuery<BoothEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'booth');
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition> config(
      FilterQuery<ConfigEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'config');
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition> outlet(
      FilterQuery<OutletEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'outlet');
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterFilterCondition> project(
      FilterQuery<ProjectEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'project');
    });
  }
}

extension GeneralEntityQueryLinks
    on QueryBuilder<GeneralEntity, GeneralEntity, QFilterCondition> {}

extension GeneralEntityQuerySortBy
    on QueryBuilder<GeneralEntity, GeneralEntity, QSortBy> {}

extension GeneralEntityQuerySortThenBy
    on QueryBuilder<GeneralEntity, GeneralEntity, QSortThenBy> {
  QueryBuilder<GeneralEntity, GeneralEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GeneralEntity, GeneralEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension GeneralEntityQueryWhereDistinct
    on QueryBuilder<GeneralEntity, GeneralEntity, QDistinct> {}

extension GeneralEntityQueryProperty
    on QueryBuilder<GeneralEntity, GeneralEntity, QQueryProperty> {
  QueryBuilder<GeneralEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GeneralEntity, AttendanceEntity?, QQueryOperations>
      attendanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendance');
    });
  }

  QueryBuilder<GeneralEntity, BoothEntity, QQueryOperations> boothProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'booth');
    });
  }

  QueryBuilder<GeneralEntity, ConfigEntity, QQueryOperations> configProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'config');
    });
  }

  QueryBuilder<GeneralEntity, OutletEntity, QQueryOperations> outletProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outlet');
    });
  }

  QueryBuilder<GeneralEntity, ProjectEntity, QQueryOperations>
      projectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'project');
    });
  }
}
