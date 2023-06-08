import 'package:flutter/material.dart'
    show
        TextEditingController,
        ValueNotifier,
        FocusNode,
        BuildContext,
        GlobalKey,
        FormState,
        Navigator;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;
import 'package:gamer_reflection/modules/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/templates/reflection_add/modal/add.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.onPressedReflectionDone,
    required this.onChangeTextReflection,
    required this.textReflection,
    required this.textFieldFocusNode,
    required this.onPressedRemoveText,
    required this.formKey,
    required this.candidatesForListener,
  });

  final void Function(BuildContext) onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final void Function() onPressedReflectionDone;
  final void Function() onPressedRemoveText;
  final void Function(String?) onChangeTextReflection;
  final TextEditingController textReflection;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<List<DomainReflectionAddReflection>>
      candidatesForListener;
}

///
UseReturn useHooks(
  List<DomainReflectionAddReflection> reflections,
  int groupId,
) {
  final FocusNode textFieldFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool?> isGood = useState<bool?>(true);
  // 更新後の振り返り一覧
  List<DomainReflectionAddReflection> addedReflections = [];
  // 表示する候補の一覧
  final candidatesForListener =
      ValueNotifier<List<DomainReflectionAddReflection>>([]);

  /// 入力欄をリセットする
  void resetInput() {
    formKey.currentState?.reset();
  }

  /// ページに保存される候補一覧を返す
  // void getAddedReflections(String text) {
  List<DomainReflectionAddReflection> getAddedReflections(String text) {
    final candidateNotExist = addedReflections.every((e) => e.text != text);

    // 重複しない場合は候補一覧に追加する
    if (candidateNotExist) {
      return [
        DomainReflectionAddReflection(
          text: text,
          count: 1,
        ),
        ...addedReflections,
      ];
    }

    // 重複する場合はcountを加算する
    return addedReflections
        .map(
          (c) => DomainReflectionAddReflection(
            count: text == c.text ? c.count + 1 : c.count,
            text: c.text,
          ),
        )
        .toList();
  }

  /// 振り返りの追加
  Future<void> addReflection(bool isGood) async {
    final String text = textReflection.value.text;

    // DBに保存する
    await RequestReflection().addReflection(
      text,
      isGood,
      groupId,
    );

    // 候補の更新
    addedReflections = getAddedReflections(text);

    // 表示する候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// モーダルで追加を押した
  void onPressedAddModal(BuildContext c, bool candidateExist) {
    // 新規追加で、振り返りの種類を押していない
    if (isGood.value == null && !candidateExist) return;

    // 振り返りの追加
    addReflection(isGood.value!);

    // 入力欄をリセットする
    resetInput();

    // 振り返り種類の初期値を更新
    isGood.value = true;

    // モーダルを消す
    Navigator.pop(
      c,
      () => {},
    );
  }

  /// 振り返りの追加を押した
  void onPressedAddReflection(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    int reflectionCount = 1;
    final text = textReflection.value.text;
    final candidateExist = !addedReflections.every((e) => e.text != text);
    // すでに追加したことがある振り返り
    if (candidateExist) {
      final DomainReflectionAddReflection domain = addedReflections.firstWhere(
        (c) => c.text == text,
      );
      reflectionCount = domain.count;
    }

    // 追加するモーダルを表示する
    showModal(
      context,
      text,
      candidateExist,
      reflectionCount,
      (BuildContext c) => onPressedAddModal(c, candidateExist),
      () => isGood.value = true,
      () => isGood.value = false,
    );
  }

  /// 振り返りの入力文字削除を押した
  void onPressedRemoveText() {
    // 入力欄をリセットする
    resetInput();

    // 候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// 振り返りの終了を押した
  void onPressedReflectionDone() {
    // モーダルを消す
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) {
    textReflection.value.text = text;
    textFieldFocusNode.unfocus();

    // 候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// 振り返りの入力中のイベント
  void onChangeTextReflection(String? t) {
    if (t == null) return;

    // 候補一覧を含まれてる文字がある内容だけに更新
    candidatesForListener.value =
        addedReflections.where((c) => c.text.contains(t)).toList();
  }

  useEffect(() {
    if (reflections.isEmpty) return;

    // 候補一覧を更新する
    addedReflections = reflections
        .map(
          (d) => DomainReflectionAddReflection(
            text: d.text,
            count: d.count,
          ),
        )
        .toList();

    return;
  }, [reflections]);

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    onPressedReflectionDone: onPressedReflectionDone,
    onPressedRemoveText: onPressedRemoveText,
    onChangeTextReflection: onChangeTextReflection,
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
    formKey: formKey,
    candidatesForListener: candidatesForListener,
  );
}
