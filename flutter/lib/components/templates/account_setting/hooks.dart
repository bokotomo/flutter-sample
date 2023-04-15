import 'package:flutter/material.dart'
    show
        ValueNotifier,
        TextEditingController,
        FocusNode,
        BuildContext,
        GlobalKey,
        FormState,
        AsyncSnapshot;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/request/reflection_group.dart'
    show RequestReflectionGroup;
import 'package:gamer_reflection/modules/storage/selected_reflection_group.dart'
    show selectReflectionGroup;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/components/templates/account_setting/modal/new_reflection_name.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.onPressedEdit,
    required this.onPressedNewName,
    required this.textReflectionName,
    required this.textReflectionNameFocusNode,
    required this.textReflectionNewName,
    required this.textReflectionNewNameFocusNode,
    required this.formKeyNewName,
    required this.formKeyEditName,
  });

  final void Function() onPressedEdit;
  final void Function(BuildContext context) onPressedNewName;
  final TextEditingController textReflectionName;
  final FocusNode textReflectionNameFocusNode;
  final TextEditingController textReflectionNewName;
  final FocusNode textReflectionNewNameFocusNode;
  final GlobalKey<FormState> formKeyNewName;
  final GlobalKey<FormState> formKeyEditName;
}

/// ロジック
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  /// 選択している期間
  final Future<String?> memoedReflectionGroup =
      useMemoized(() => selectReflectionGroup.get());
  final AsyncSnapshot<String?> futuredReflectionGroup =
      useFuture(memoedReflectionGroup);
  final ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNameFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflectionNewName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNewNameFocusNode = useFocusNode();
  final GlobalKey<FormState> formKeyNewName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEditName = GlobalKey<FormState>();

  /// 振り返り名の変更を押した
  Future<void> onPressedEdit() async {
    if (!formKeyEditName.currentState!.validate()) return;

    final int id = int.parse(futuredReflectionGroup.data.toString());
    final String name = textReflectionName.value.text;

    /// 入力欄をリセットする
    formKeyEditName.currentState?.reset();
    textReflectionName.value.text = name;

    /// DB更新
    await RequestReflectionGroup().updateReflectionGroup(id, name);
  }

  /// 新規振り返り名の追加を押した
  Future<void> onPressedAddRefletionGroup() async {
    final String name = textReflectionNewName.value.text;
    if (name.isEmpty) return;

    /// DBに追加
    final int id = await RequestReflectionGroup().addReflectionGroup(name);

    /// 選択しているキャッシュに保存
    selectReflectionGroup.save(id.toString());

    /// 入力欄をリセットする
    textReflectionNewName.value.text = "";
    formKeyNewName.currentState?.reset();
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

  useEffect(() {
    if (futuredReflectionGroup.data == null) return;

    final int id = int.parse(futuredReflectionGroup.data.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == id,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    textReflectionName.value.text = d.name;
  }, [futuredReflectionGroup.data]);

  return UseReturn(
    onPressedEdit: onPressedEdit,
    onPressedNewName: onPressedNewName,
    formKeyNewName: formKeyNewName,
    formKeyEditName: formKeyEditName,
    textReflectionName: textReflectionName.value,
    textReflectionNameFocusNode: textReflectionNameFocusNode,
    textReflectionNewName: textReflectionNewName.value,
    textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
  );
}
