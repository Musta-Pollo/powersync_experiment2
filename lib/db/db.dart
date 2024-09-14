import 'package:drift/drift.dart';
import 'package:drift_sqlite_async/drift_sqlite_async.dart';
import 'package:powersync_experiment/db/models.dart';
import 'package:sqlite_async/sqlite_async.dart';

import 'schema_versions.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase(SqliteConnection db) : super(SqliteAsyncDriftConnection(db));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          print("Creating all tables");
          await m.createAll();
        },
        onUpgrade: stepByStep(from1To2: (m, schema) async {
          //return m.addColumn(schema.todos, schema.todos.description);
          await m.addColumn(schema.todos, schema.todos.description2);
          m.database.customStatement('''
            UPDATE todos SET description2 = description;
            ''');
        }, from2To3: (m, schema) async {
          await m.addColumn(schema.todos, schema.todos.description3);
          m.database.customStatement('''
            UPDATE todos SET description3 = description;
            ''');
        }),
      );
}
