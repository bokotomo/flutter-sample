// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'storage/rdb/repository/command/reflection.dart' as _i3;
import 'storage/rdb/repository/command/reflection_group.dart' as _i4;
import 'storage/rdb/repository/command/todo.dart' as _i7;
import 'storage/rdb/repository/query/reflection.dart' as _i6;
import 'storage/rdb/repository/query/reflection_group.dart' as _i5;
import 'storage/rdb/repository/query/todo.dart' as _i8;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IRepositoryReflectionCommand>(
      () => _i3.RepositoryReflectionCommand());
  gh.factory<_i4.IRepositoryReflectionGroupCommand>(
      () => _i4.RepositoryReflectionGroupCommand());
  gh.factory<_i5.IRepositoryReflectionGroupQuery>(
      () => _i5.RepositoryReflectionQuery());
  gh.factory<_i6.IRepositoryReflectionQuery>(
      () => _i6.RepositoryReflectionQuery());
  gh.factory<_i7.IRepositoryTodoCommand>(() => _i7.RepositoryTodoCommand());
  gh.factory<_i8.IRepositoryTodoQuery>(() => _i8.RepositoryTodoQuery());
  return getIt;
}
