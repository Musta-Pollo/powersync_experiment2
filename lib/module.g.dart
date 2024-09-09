// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabasePHash() => r'ac9e71181aa05b61ba782fc5a7b39f1775390214';

/// See also [AppDatabaseP].
@ProviderFor(AppDatabaseP)
final appDatabasePProvider =
    NotifierProvider<AppDatabaseP, AppDatabase>.internal(
  AppDatabaseP.new,
  name: r'appDatabasePProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabasePHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppDatabaseP = Notifier<AppDatabase>;
String _$todoPHash() => r'f50daca10ba469647223996b467652100ed4885a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoP extends BuildlessAutoDisposeAsyncNotifier<TodoItem> {
  late final int taskId;

  FutureOr<TodoItem> build(
    int taskId,
  );
}

/// See also [TodoP].
@ProviderFor(TodoP)
const todoPProvider = TodoPFamily();

/// See also [TodoP].
class TodoPFamily extends Family<AsyncValue<TodoItem>> {
  /// See also [TodoP].
  const TodoPFamily();

  /// See also [TodoP].
  TodoPProvider call(
    int taskId,
  ) {
    return TodoPProvider(
      taskId,
    );
  }

  @override
  TodoPProvider getProviderOverride(
    covariant TodoPProvider provider,
  ) {
    return call(
      provider.taskId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoPProvider';
}

/// See also [TodoP].
class TodoPProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TodoP, TodoItem> {
  /// See also [TodoP].
  TodoPProvider(
    int taskId,
  ) : this._internal(
          () => TodoP()..taskId = taskId,
          from: todoPProvider,
          name: r'todoPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todoPHash,
          dependencies: TodoPFamily._dependencies,
          allTransitiveDependencies: TodoPFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TodoPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  FutureOr<TodoItem> runNotifierBuild(
    covariant TodoP notifier,
  ) {
    return notifier.build(
      taskId,
    );
  }

  @override
  Override overrideWith(TodoP Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoPProvider._internal(
        () => create()..taskId = taskId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TodoP, TodoItem> createElement() {
    return _TodoPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoPProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TodoPRef on AutoDisposeAsyncNotifierProviderRef<TodoItem> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TodoPProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TodoP, TodoItem>
    with TodoPRef {
  _TodoPProviderElement(super.provider);

  @override
  int get taskId => (origin as TodoPProvider).taskId;
}

String _$allTodosIdsPHash() => r'f484ac1b3d5e1e70aa26df492d13cbf46371e8b1';

/// See also [AllTodosIdsP].
@ProviderFor(AllTodosIdsP)
final allTodosIdsPProvider =
    AutoDisposeAsyncNotifierProvider<AllTodosIdsP, IList<int>>.internal(
  AllTodosIdsP.new,
  name: r'allTodosIdsPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allTodosIdsPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllTodosIdsP = AutoDisposeAsyncNotifier<IList<int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
