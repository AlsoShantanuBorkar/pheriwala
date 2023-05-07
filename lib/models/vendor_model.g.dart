// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVendorModelCollection on Isar {
  IsarCollection<VendorModel> get vendorModels => this.collection();
}

const VendorModelSchema = CollectionSchema(
  name: r'VendorModel',
  id: -7683415128182415933,
  properties: {
    r'distancefromuser': PropertySchema(
      id: 0,
      name: r'distancefromuser',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'latitude': PropertySchema(
      id: 2,
      name: r'latitude',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 3,
      name: r'location',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 4,
      name: r'longitude',
      type: IsarType.string,
    ),
    r'shopname': PropertySchema(
      id: 5,
      name: r'shopname',
      type: IsarType.string,
    ),
    r'vendorcontact': PropertySchema(
      id: 6,
      name: r'vendorcontact',
      type: IsarType.string,
    ),
    r'vendorname': PropertySchema(
      id: 7,
      name: r'vendorname',
      type: IsarType.string,
    )
  },
  estimateSize: _vendorModelEstimateSize,
  serialize: _vendorModelSerialize,
  deserialize: _vendorModelDeserialize,
  deserializeProp: _vendorModelDeserializeProp,
  idName: r'vendorID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vendorModelGetId,
  getLinks: _vendorModelGetLinks,
  attach: _vendorModelAttach,
  version: '3.1.0+1',
);

int _vendorModelEstimateSize(
  VendorModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.latitude;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.longitude;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.shopname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vendorcontact;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vendorname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _vendorModelSerialize(
  VendorModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.distancefromuser);
  writer.writeLong(offsets[1], object.id);
  writer.writeString(offsets[2], object.latitude);
  writer.writeString(offsets[3], object.location);
  writer.writeString(offsets[4], object.longitude);
  writer.writeString(offsets[5], object.shopname);
  writer.writeString(offsets[6], object.vendorcontact);
  writer.writeString(offsets[7], object.vendorname);
}

VendorModel _vendorModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VendorModel(
    distancefromuser: reader.readLongOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    latitude: reader.readStringOrNull(offsets[2]),
    location: reader.readStringOrNull(offsets[3]),
    longitude: reader.readStringOrNull(offsets[4]),
    shopname: reader.readStringOrNull(offsets[5]),
    vendorcontact: reader.readStringOrNull(offsets[6]),
    vendorname: reader.readStringOrNull(offsets[7]),
  );
  object.vendorID = id;
  return object;
}

P _vendorModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vendorModelGetId(VendorModel object) {
  return object.vendorID;
}

List<IsarLinkBase<dynamic>> _vendorModelGetLinks(VendorModel object) {
  return [];
}

void _vendorModelAttach(
    IsarCollection<dynamic> col, Id id, VendorModel object) {
  object.vendorID = id;
}

extension VendorModelQueryWhereSort
    on QueryBuilder<VendorModel, VendorModel, QWhere> {
  QueryBuilder<VendorModel, VendorModel, QAfterWhere> anyVendorID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VendorModelQueryWhere
    on QueryBuilder<VendorModel, VendorModel, QWhereClause> {
  QueryBuilder<VendorModel, VendorModel, QAfterWhereClause> vendorIDEqualTo(
      Id vendorID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: vendorID,
        upper: vendorID,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterWhereClause> vendorIDNotEqualTo(
      Id vendorID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: vendorID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: vendorID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: vendorID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: vendorID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterWhereClause> vendorIDGreaterThan(
      Id vendorID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: vendorID, includeLower: include),
      );
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterWhereClause> vendorIDLessThan(
      Id vendorID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: vendorID, includeUpper: include),
      );
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterWhereClause> vendorIDBetween(
    Id lowerVendorID,
    Id upperVendorID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerVendorID,
        includeLower: includeLower,
        upper: upperVendorID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VendorModelQueryFilter
    on QueryBuilder<VendorModel, VendorModel, QFilterCondition> {
  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distancefromuser',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distancefromuser',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distancefromuser',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distancefromuser',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distancefromuser',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      distancefromuserBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distancefromuser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> latitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> latitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> latitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'latitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      latitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'longitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      longitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shopname',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shopname',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> shopnameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> shopnameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shopname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shopname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> shopnameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shopname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shopname',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      shopnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shopname',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> vendorIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorID',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendorID',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendorID',
        value: value,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition> vendorIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendorID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendorcontact',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendorcontact',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendorcontact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendorcontact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendorcontact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorcontact',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendorcontactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendorcontact',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendorname',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendorname',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendorname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendorname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendorname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorname',
        value: '',
      ));
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterFilterCondition>
      vendornameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendorname',
        value: '',
      ));
    });
  }
}

extension VendorModelQueryObject
    on QueryBuilder<VendorModel, VendorModel, QFilterCondition> {}

extension VendorModelQueryLinks
    on QueryBuilder<VendorModel, VendorModel, QFilterCondition> {}

extension VendorModelQuerySortBy
    on QueryBuilder<VendorModel, VendorModel, QSortBy> {
  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      sortByDistancefromuser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distancefromuser', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      sortByDistancefromuserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distancefromuser', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByShopname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopname', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByShopnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopname', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByVendorcontact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorcontact', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      sortByVendorcontactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorcontact', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByVendorname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorname', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> sortByVendornameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorname', Sort.desc);
    });
  }
}

extension VendorModelQuerySortThenBy
    on QueryBuilder<VendorModel, VendorModel, QSortThenBy> {
  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      thenByDistancefromuser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distancefromuser', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      thenByDistancefromuserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distancefromuser', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByShopname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopname', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByShopnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopname', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByVendorID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorID', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByVendorIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorID', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByVendorcontact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorcontact', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy>
      thenByVendorcontactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorcontact', Sort.desc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByVendorname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorname', Sort.asc);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QAfterSortBy> thenByVendornameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorname', Sort.desc);
    });
  }
}

extension VendorModelQueryWhereDistinct
    on QueryBuilder<VendorModel, VendorModel, QDistinct> {
  QueryBuilder<VendorModel, VendorModel, QDistinct>
      distinctByDistancefromuser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distancefromuser');
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByShopname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shopname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByVendorcontact(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendorcontact',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VendorModel, VendorModel, QDistinct> distinctByVendorname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendorname', caseSensitive: caseSensitive);
    });
  }
}

extension VendorModelQueryProperty
    on QueryBuilder<VendorModel, VendorModel, QQueryProperty> {
  QueryBuilder<VendorModel, int, QQueryOperations> vendorIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendorID');
    });
  }

  QueryBuilder<VendorModel, int?, QQueryOperations> distancefromuserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distancefromuser');
    });
  }

  QueryBuilder<VendorModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> shopnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shopname');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> vendorcontactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendorcontact');
    });
  }

  QueryBuilder<VendorModel, String?, QQueryOperations> vendornameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendorname');
    });
  }
}
