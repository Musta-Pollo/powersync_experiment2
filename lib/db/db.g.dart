// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _description2Meta =
      const VerificationMeta('description2');
  @override
  late final GeneratedColumn<String> description2 = GeneratedColumn<String>(
      'description2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _description3Meta =
      const VerificationMeta('description3');
  @override
  late final GeneratedColumn<String> description3 = GeneratedColumn<String>(
      'description3', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, description2, description3];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('description2')) {
      context.handle(
          _description2Meta,
          description2.isAcceptableOrUnknown(
              data['description2']!, _description2Meta));
    }
    if (data.containsKey('description3')) {
      context.handle(
          _description3Meta,
          description3.isAcceptableOrUnknown(
              data['description3']!, _description3Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      description2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description2']),
      description3: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description3']),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String description;
  final String? description2;
  final String? description3;
  const TodoItem(
      {required this.id,
      required this.description,
      this.description2,
      this.description3});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || description2 != null) {
      map['description2'] = Variable<String>(description2);
    }
    if (!nullToAbsent || description3 != null) {
      map['description3'] = Variable<String>(description3);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      description: Value(description),
      description2: description2 == null && nullToAbsent
          ? const Value.absent()
          : Value(description2),
      description3: description3 == null && nullToAbsent
          ? const Value.absent()
          : Value(description3),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      description2: serializer.fromJson<String?>(json['description2']),
      description3: serializer.fromJson<String?>(json['description3']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'description2': serializer.toJson<String?>(description2),
      'description3': serializer.toJson<String?>(description3),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? description,
          Value<String?> description2 = const Value.absent(),
          Value<String?> description3 = const Value.absent()}) =>
      TodoItem(
        id: id ?? this.id,
        description: description ?? this.description,
        description2:
            description2.present ? description2.value : this.description2,
        description3:
            description3.present ? description3.value : this.description3,
      );
  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('description2: $description2, ')
          ..write('description3: $description3')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, description2, description3);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.description == this.description &&
          other.description2 == this.description2 &&
          other.description3 == this.description3);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> description;
  final Value<String?> description2;
  final Value<String?> description3;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.description2 = const Value.absent(),
    this.description3 = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.description2 = const Value.absent(),
    this.description3 = const Value.absent(),
  }) : description = Value(description);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String>? description2,
    Expression<String>? description3,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (description2 != null) 'description2': description2,
      if (description3 != null) 'description3': description3,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<String?>? description2,
      Value<String?>? description3}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      description2: description2 ?? this.description2,
      description3: description3 ?? this.description3,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (description2.present) {
      map['description2'] = Variable<String>(description2.value);
    }
    if (description3.present) {
      map['description3'] = Variable<String>(description3.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('description2: $description2, ')
          ..write('description3: $description3')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItems];
}
