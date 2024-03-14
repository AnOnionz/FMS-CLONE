// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_metadata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFileWithMetaDataCollection on Isar {
  IsarCollection<FileWithMetaData> get fileWithMetaDatas => this.collection();
}

const FileWithMetaDataSchema = CollectionSchema(
  name: r'FileWithMetaData',
  id: 5420175531907709532,
  properties: {
    r'lat': PropertySchema(
      id: 0,
      name: r'lat',
      type: IsarType.double,
    ),
    r'length': PropertySchema(
      id: 1,
      name: r'length',
      type: IsarType.long,
    ),
    r'lng': PropertySchema(
      id: 2,
      name: r'lng',
      type: IsarType.double,
    ),
    r'rawPath': PropertySchema(
      id: 3,
      name: r'rawPath',
      type: IsarType.longList,
    ),
    r'time': PropertySchema(
      id: 4,
      name: r'time',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _fileWithMetaDataEstimateSize,
  serialize: _fileWithMetaDataSerialize,
  deserialize: _fileWithMetaDataDeserialize,
  deserializeProp: _fileWithMetaDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fileWithMetaDataGetId,
  getLinks: _fileWithMetaDataGetLinks,
  attach: _fileWithMetaDataAttach,
  version: '3.1.0+1',
);

int _fileWithMetaDataEstimateSize(
  FileWithMetaData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.rawPath.length * 8;
  return bytesCount;
}

void _fileWithMetaDataSerialize(
  FileWithMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.lat);
  writer.writeLong(offsets[1], object.length);
  writer.writeDouble(offsets[2], object.lng);
  writer.writeLongList(offsets[3], object.rawPath);
  writer.writeDateTime(offsets[4], object.time);
}

FileWithMetaData _fileWithMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FileWithMetaData(
    id: id,
    lat: reader.readDoubleOrNull(offsets[0]),
    length: reader.readLongOrNull(offsets[1]),
    lng: reader.readDoubleOrNull(offsets[2]),
    rawPath: reader.readLongList(offsets[3]) ?? [],
    time: reader.readDateTimeOrNull(offsets[4]),
  );
  return object;
}

P _fileWithMetaDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fileWithMetaDataGetId(FileWithMetaData object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _fileWithMetaDataGetLinks(FileWithMetaData object) {
  return [];
}

void _fileWithMetaDataAttach(
    IsarCollection<dynamic> col, Id id, FileWithMetaData object) {
  object.id = id;
}

extension FileWithMetaDataQueryWhereSort
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QWhere> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FileWithMetaDataQueryWhere
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QWhereClause> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhereClause>
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

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterWhereClause> idBetween(
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

extension FileWithMetaDataQueryFilter
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QFilterCondition> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
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

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
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

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
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

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'length',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      lngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawPath',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawPath',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawPath',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      rawPathLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rawPath',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterFilterCondition>
      timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FileWithMetaDataQueryObject
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QFilterCondition> {}

extension FileWithMetaDataQueryLinks
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QFilterCondition> {}

extension FileWithMetaDataQuerySortBy
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QSortBy> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      sortByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      sortByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension FileWithMetaDataQuerySortThenBy
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QSortThenBy> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension FileWithMetaDataQueryWhereDistinct
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct> {
  QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct>
      distinctByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'length');
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct> distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct>
      distinctByRawPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawPath');
    });
  }

  QueryBuilder<FileWithMetaData, FileWithMetaData, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }
}

extension FileWithMetaDataQueryProperty
    on QueryBuilder<FileWithMetaData, FileWithMetaData, QQueryProperty> {
  QueryBuilder<FileWithMetaData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FileWithMetaData, double?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<FileWithMetaData, int?, QQueryOperations> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'length');
    });
  }

  QueryBuilder<FileWithMetaData, double?, QQueryOperations> lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<FileWithMetaData, List<int>, QQueryOperations>
      rawPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawPath');
    });
  }

  QueryBuilder<FileWithMetaData, DateTime?, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}
