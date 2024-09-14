import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:powersync_experiment/db/db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_async/sqlite_async.dart';

part 'module.g.dart';

//Future<String> checkPath(String dbName) async {
//  var databasePath = await getDatabasesPath();
//  String path = join(databasePath, dbName);
//  if (await Directory(dirname(path)).exists()) {
//  } else {
//    try {
//      await Directory(dirname(path)).create(recursive: true);
//    } catch (e) {
//      print(e);
//    }
//  }
//  return path;
//}

@riverpod
String dbPathP(DbPathPRef ref) {
  throw UnimplementedError();
}

@riverpod
class AppDatabaseP extends _$AppDatabaseP {
  @override
  AppDatabase build() {
    final dbPath = ref.read(dbPathPProvider);
    final db = AppDatabase(SqliteDatabase(path: dbPath));
    ref.onDispose(() async {
      await db.close();
    });
    return db;
  }
}

//@riverpod
//AppDatabase appDatabaseP(AppDatabasePRef ref) {
//  throw UnimplementedError();
//}

@riverpod
class TodoP extends _$TodoP {
  @override
  FutureOr<TodoItem> build(int taskId) async {
    final appdb = ref.read(appDatabasePProvider);

    (appdb.select(appdb.todoItems)..where((t) => t.id.equals(taskId)))
        .watch()
        .listen(
      (event) {
        if (event.isNotEmpty) {
          state = AsyncValue.data(event.first);
        } else {
          state = const AsyncValue.loading();
        }
      },
    );
    final data = await (appdb.select(appdb.todoItems)
          ..where((t) => t.id.equals(taskId)))
        .getSingle();
    return data;
  }
}

@riverpod
class AllTodosIdsP extends _$AllTodosIdsP {
  @override
  FutureOr<IList<int>> build() async {
    final appdb = ref.read(appDatabasePProvider);

    (appdb.selectOnly(appdb.todoItems)..addColumns([appdb.todoItems.id]))
        .map(
          (row) => row.read(appdb.todoItems.id),
        )
        .watch()
        .listen(
      (event) {
        if (event.isNotEmpty) {
          state = AsyncValue.data(event.whereNotNull().toIList());
        } else {
          state = const AsyncValue.loading();
        }
      },
    );
    final data = await (appdb.selectOnly(appdb.todoItems)
          ..addColumns([appdb.todoItems.id]))
        .map(
          (row) => row.read(appdb.todoItems.id),
        )
        .get();
    return data.whereNotNull().toIList();
  }
}
