import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_group.dart'
    show tableNameReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/domain/reflection_group.dart'
    show DomainAccountSettingReflectionGroup;

/// Interface: IRepositoryReflectionGroupQuery
abstract class IRepositoryReflectionGroupQuery {
  Future<List<DomainAccountSettingReflectionGroup>> getReflectionGroups(
      Database db);
}

/// Repository: 振り返りグループ
@Injectable(as: IRepositoryReflectionGroupQuery)
class RepositoryReflectionQuery extends IRepositoryReflectionGroupQuery {
  /// 取得: 振り返りグループ一覧
  @override
  Future<List<DomainAccountSettingReflectionGroup>> getReflectionGroups(
      Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionGroup,
      columns: ['*'],
      limit: 40,
    );

    return List.generate(
      res.length,
      (i) {
        return DomainAccountSettingReflectionGroup(
          id: res[i]['id'] as int,
          name: res[i]['name'] as String,
        );
      },
    );
  }
}
