// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetProjectCollection on Isar {
  IsarCollection<Project> get projects => getCollection();
}

const ProjectSchema = CollectionSchema(
  name: 'Project',
  schema:
      '{"name":"Project","idName":"id","properties":[{"name":"estimate","type":"Long"},{"name":"name","type":"String"},{"name":"status","type":"Long"}],"indexes":[],"links":[{"name":"tasks","target":"ProjectTask"}]}',
  idName: 'id',
  propertyIds: {'estimate': 0, 'name': 1, 'status': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tasks': 0},
  backlinkLinkNames: {},
  getId: _projectGetId,
  setId: _projectSetId,
  getLinks: _projectGetLinks,
  attachLinks: _projectAttachLinks,
  serializeNative: _projectSerializeNative,
  deserializeNative: _projectDeserializeNative,
  deserializePropNative: _projectDeserializePropNative,
  serializeWeb: _projectSerializeWeb,
  deserializeWeb: _projectDeserializeWeb,
  deserializePropWeb: _projectDeserializePropWeb,
  version: 4,
);

int? _projectGetId(Project object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _projectSetId(Project object, int id) {
  object.id = id;
}

List<IsarLinkBase> _projectGetLinks(Project object) {
  return [object.tasks];
}

const _projectProjectStatusConverter = ProjectStatusConverter();

void _projectSerializeNative(
    IsarCollection<Project> collection,
    IsarCObject cObj,
    Project object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.estimate;
  final _estimate = value0;
  final value1 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_name.length) as int;
  final value2 = _projectProjectStatusConverter.toIsar(object.status);
  final _status = value2;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _estimate);
  writer.writeBytes(offsets[1], _name);
  writer.writeLong(offsets[2], _status);
}

Project _projectDeserializeNative(IsarCollection<Project> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Project();
  object.estimate = reader.readLong(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.status =
      _projectProjectStatusConverter.fromIsar(reader.readLong(offsets[2]));
  _projectAttachLinks(collection, id, object);
  return object;
}

P _projectDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_projectProjectStatusConverter.fromIsar(reader.readLong(offset)))
          as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _projectSerializeWeb(
    IsarCollection<Project> collection, Project object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'estimate', object.estimate);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(
      jsObj, 'status', _projectProjectStatusConverter.toIsar(object.status));
  return jsObj;
}

Project _projectDeserializeWeb(
    IsarCollection<Project> collection, dynamic jsObj) {
  final object = Project();
  object.estimate =
      IsarNative.jsObjectGet(jsObj, 'estimate') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.status = _projectProjectStatusConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'status') ?? double.negativeInfinity);
  _projectAttachLinks(collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _projectDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'estimate':
      return (IsarNative.jsObjectGet(jsObj, 'estimate') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'status':
      return (_projectProjectStatusConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'status') ??
              double.negativeInfinity)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _projectAttachLinks(IsarCollection col, int id, Project object) {
  object.tasks.attach(col, col.isar.projectTasks, 'tasks', id);
}

extension ProjectQueryWhereSort on QueryBuilder<Project, Project, QWhere> {
  QueryBuilder<Project, Project, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ProjectQueryWhere on QueryBuilder<Project, Project, QWhereClause> {
  QueryBuilder<Project, Project, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Project, Project, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Project, Project, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Project, Project, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Project, Project, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension ProjectQueryFilter
    on QueryBuilder<Project, Project, QFilterCondition> {
  QueryBuilder<Project, Project, QAfterFilterCondition> estimateEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'estimate',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> estimateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'estimate',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> estimateLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'estimate',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> estimateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'estimate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> statusEqualTo(
      ProjectStatus value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: _projectProjectStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> statusGreaterThan(
    ProjectStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: _projectProjectStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> statusLessThan(
    ProjectStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: _projectProjectStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> statusBetween(
    ProjectStatus lower,
    ProjectStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: _projectProjectStatusConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _projectProjectStatusConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension ProjectQueryLinks
    on QueryBuilder<Project, Project, QFilterCondition> {
  QueryBuilder<Project, Project, QAfterFilterCondition> tasks(
      FilterQuery<ProjectTask> q) {
    return linkInternal(
      isar.projectTasks,
      q,
      'tasks',
    );
  }
}

extension ProjectQueryWhereSortBy on QueryBuilder<Project, Project, QSortBy> {
  QueryBuilder<Project, Project, QAfterSortBy> sortByEstimate() {
    return addSortByInternal('estimate', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByEstimateDesc() {
    return addSortByInternal('estimate', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension ProjectQueryWhereSortThenBy
    on QueryBuilder<Project, Project, QSortThenBy> {
  QueryBuilder<Project, Project, QAfterSortBy> thenByEstimate() {
    return addSortByInternal('estimate', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByEstimateDesc() {
    return addSortByInternal('estimate', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }
}

extension ProjectQueryWhereDistinct
    on QueryBuilder<Project, Project, QDistinct> {
  QueryBuilder<Project, Project, QDistinct> distinctByEstimate() {
    return addDistinctByInternal('estimate');
  }

  QueryBuilder<Project, Project, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Project, Project, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Project, Project, QDistinct> distinctByStatus() {
    return addDistinctByInternal('status');
  }
}

extension ProjectQueryProperty
    on QueryBuilder<Project, Project, QQueryProperty> {
  QueryBuilder<Project, int, QQueryOperations> estimateProperty() {
    return addPropertyNameInternal('estimate');
  }

  QueryBuilder<Project, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Project, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Project, ProjectStatus, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }
}
