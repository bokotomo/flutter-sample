import 'package:flutter/material.dart'
    show
        ValueNotifier,
        TextEditingController,
        FocusNode,
        BuildContext,
        GlobalKey,
        FormState,
        AsyncSnapshot,
        Navigator;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/request/reflection_group.dart'
    show RequestReflectionGroup;
import 'package:gamer_reflection/modules/storage/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/components/templates/account_setting/modal/new_reflection_name.dart'
    show showModal;
import 'package:gamer_reflection/components/templates/account_setting/modal/delete_reflection_group.dart'
    show showDeleteModal;

class UseReturn {
  const UseReturn({
    required this.onPressedEdit,
    required this.onPressedDelete,
    required this.onPressedNewName,
    required this.onChangeReflectionGroup,
    required this.textReflectionName,
    required this.textReflectionNameFocusNode,
    required this.textReflectionNewName,
    required this.textReflectionNewNameFocusNode,
    required this.formKeyNewName,
    required this.formKeyEditName,
  });

  final void Function() onPressedEdit;
  final void Function(BuildContext context) onPressedDelete;
  final void Function(BuildContext context) onPressedNewName;
  final void Function(String?) onChangeReflectionGroup;
  final TextEditingController textReflectionName;
  final FocusNode textReflectionNameFocusNode;
  final TextEditingController textReflectionNewName;
  final FocusNode textReflectionNewNameFocusNode;
  final GlobalKey<FormState> formKeyNewName;
  final GlobalKey<FormState> formKeyEditName;
}

/// ロジック
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  Future<void> Function() fetchReflectionGroups,
) {
  /// 選択している期間
  final Future<String?> memoedReflectionGroupId =
      useMemoized(() => selectReflectionGroupId.get());
  final AsyncSnapshot<String?> futuredReflectionGroupId =
      useFuture(memoedReflectionGroupId);
  final ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNameFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflectionNewName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNewNameFocusNode = useFocusNode();
  final GlobalKey<FormState> formKeyNewName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEditName = GlobalKey<FormState>();

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.isEmpty ? 0 : reflectionGroups[0].id;
  }

  /// 振り返り名の変更を押した
  Future<void> onPressedEdit() async {
    if (!formKeyEditName.currentState!.validate()) return;
    final groupId = await selectReflectionGroupId.get();
    final int id = getReflectionGroupId(groupId);
    final String name = textReflectionName.value.text;

    /// 入力欄をリセットする
    formKeyEditName.currentState?.reset();
    textReflectionName.value.text = name;

    /// DB更新
    await RequestReflectionGroup().updateReflectionGroup(id, name);

    /// 振り返りグループ再読み込み
    fetchReflectionGroups();
  }

  /// 新規振り返り名の追加を押した
  Future<void> onPressedAddRefletionGroup(BuildContext context) async {
    final String name = textReflectionNewName.value.text;
    if (name.isEmpty) return;

    /// DBに追加
    final int id = await RequestReflectionGroup().addReflectionGroup(name);

    /// 選択しているキャッシュに保存
    selectReflectionGroupId.save(id.toString());

    /// 入力欄をリセットする
    textReflectionNewName.value.text = "";
    formKeyNewName.currentState?.reset();

    /// 振り返りグループ再読み込み
    fetchReflectionGroups();

    ///
    textReflectionName.value.text = name;

    ///
    if (context.mounted) Navigator.pop(context);
  }

  /// 新規振り返り名の追加を押した
  void onPressedNewName(BuildContext context) {
    if (!formKeyNewName.currentState!.validate()) return;

    showModal(
      context,
      textReflectionNewName.value.text,
      onPressedAddRefletionGroup,
    );
  }

  /// 振り返り名入力の更新
  void updateReflectionName(String? id) {
    final int groupId = getReflectionGroupId(id);

    /// 振り返りグループの取得
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    /// 選択振り返り名の更新
    textReflectionName.value.text = d.name;
  }

  /// 振り返りグループを変更した
  void onChangeReflectionGroup(String? id) {
    updateReflectionName(id);

    /// 振り返りグループ再読み込み
    fetchReflectionGroups();
  }

  /// 振り返りグループを削除する
  void deleteRefletionGroup(String? id) async {
    if (id == null) return;

    /// グループが1個なら削除できない
    if (reflectionGroups.length <= 1) return;

    /// DB削除
    await RequestReflectionGroup().deleteReflection(int.parse(id));

    /// キャッシュを先頭のグループにする
    final int groupId = reflectionGroups.isEmpty ? 1 : reflectionGroups[0].id;
    selectReflectionGroupId.save(groupId.toString());

    /// 振り返りグループ再読み込み
    fetchReflectionGroups();

    /// 振り返りグループの取得
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    /// 名前の更新
    textReflectionName.value.text = d.name;
  }

  /// 削除を押した
  Future<void> onPressedDelete(BuildContext context) async {
    final id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);

    /// 振り返りグループの取得
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );
    if (context.mounted) {
      showDeleteModal(
        context,
        d.name,
        (context) {
          deleteRefletionGroup(id);
          Navigator.pop(context);
        },
      );
    }
  }

  useEffect(() {
    if (futuredReflectionGroupId.data == null) return;
    updateReflectionName(futuredReflectionGroupId.data);
  }, [futuredReflectionGroupId.data]);

  return UseReturn(
    onPressedEdit: onPressedEdit,
    onPressedDelete: onPressedDelete,
    onPressedNewName: onPressedNewName,
    onChangeReflectionGroup: onChangeReflectionGroup,
    formKeyNewName: formKeyNewName,
    formKeyEditName: formKeyEditName,
    textReflectionName: textReflectionName.value,
    textReflectionNameFocusNode: textReflectionNameFocusNode,
    textReflectionNewName: textReflectionNewName.value,
    textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
  );
}
