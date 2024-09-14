import 'package:drift/drift.dart';

class TodoItems extends Table {
  @override
  String get tableName => 'todos';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get description2 => text().nullable()();
  TextColumn get description3 => text().nullable()();
}
