import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:powersync_experiment/db/db.dart';
import 'package:powersync_experiment/module.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTaskIds = ref.watch(allTodosIdsPProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final appdb = ref.read(appDatabasePProvider);
            final id = await appdb.into(appdb.todoItems).insert(
                  const TodoItemsCompanion(
                    description: Value("My Descrpiton"),
                  ),
                );
            print(id);
          },
          child: const Icon(Icons.add),
        ),
        body: allTaskIds.when(
          data: (ids) {
            return ListView.builder(
              itemCount: ids.length,
              itemBuilder: (context, index) {
                return TodoTile(taskId: ids[index]);
              },
            );
          },
          error: (e, st) {
            return Container();
          },
          loading: () => Container(),
        ));
  }
}

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.taskId});

  final int taskId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(todoPProvider(taskId));
    return task.when(
        data: (task) {
          return ListTile(
            title: Text(task.description),
          );
        },
        error: (e, st) {
          return Container();
        },
        loading: () => const CircularProgressIndicator());
  }
}
