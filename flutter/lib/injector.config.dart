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

import 'storage/rdb/repository/command/game.dart' as _i3;
import 'storage/rdb/repository/command/reflection.dart' as _i5;
import 'storage/rdb/repository/command/reflection_group.dart' as _i6;
import 'storage/rdb/repository/command/reflection_history.dart' as _i9;
import 'storage/rdb/repository/command/reflection_history_group.dart' as _i10;
import 'storage/rdb/repository/command/todo.dart' as _i13;
import 'storage/rdb/repository/query/game.dart' as _i4;
import 'storage/rdb/repository/query/reflection.dart' as _i12;
import 'storage/rdb/repository/query/reflection_group.dart' as _i7;
import 'storage/rdb/repository/query/reflection_history.dart' as _i8;
import 'storage/rdb/repository/query/reflection_history_group.dart' as _i11;
import 'storage/rdb/repository/query/todo.dart' as _i14;

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
  gh.factory<_i3.IRepositoryGameCommand>(() => _i3.RepositoryGameCommand());
  gh.factory<_i4.IRepositoryGameQuery>(() => _i4.RepositoryGameQuery());
  gh.factory<_i5.IRepositoryReflectionCommand>(
      () => _i5.RepositoryReflectionCommand());
  gh.factory<_i6.IRepositoryReflectionGroupCommand>(
      () => _i6.RepositoryReflectionGroupCommand());
  gh.factory<_i7.IRepositoryReflectionGroupQuery>(
      () => _i7.RepositoryReflectionQuery());
  gh.factory<_i8.IRepositoryReflectionHisotryQuery>(
      () => _i8.RepositoryReflectionHistoryQuery());
  gh.factory<_i9.IRepositoryReflectionHistoryCommand>(
      () => _i9.RepositoryReflectionHistoryCommand());
  gh.factory<_i10.IRepositoryReflectionHistoryGroupCommand>(
      () => _i10.RepositoryReflectionHistoryGroupCommand());
  gh.factory<_i11.IRepositoryReflectionHistoryGroupQuery>(
      () => _i11.RepositoryReflectionHistoryGroupQuery());
  gh.factory<_i12.IRepositoryReflectionQuery>(
      () => _i12.RepositoryReflectionQuery());
  gh.factory<_i13.IRepositoryTodoCommand>(() => _i13.RepositoryTodoCommand());
  gh.factory<_i14.IRepositoryTodoQuery>(() => _i14.RepositoryTodoQuery());
  return getIt;
}
