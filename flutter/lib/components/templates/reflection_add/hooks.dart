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
    show DomainReflection;
import 'package:gamer_reflection/components/templates/reflection_add/modal/add.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.onPressedReflectionDone,
    required this.textReflection,
    required this.candidates,
    required this.textFieldFocusNode,
    required this.onPressedRemoveText,
    required this.formKey,
  });

  final void Function(BuildContext) onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final void Function() onPressedReflectionDone;
  final void Function() onPressedRemoveText;
  final TextEditingController textReflection;
  final List<DomainReflection> candidates;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
}

///
UseReturn useHooks(
  List<DomainReflection> reflections,
  int groupId,
) {
  final FocusNode textFieldFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<List<DomainReflection>> candidates =
      useState<List<DomainReflection>>([]);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool?> isGood = useState<bool?>(true);

  /// 入力欄をリセットする
  void resetInput() {
    formKey.currentState?.reset();
    textReflection.value.text = "";
  }

  /// 振り返りの追加
  Future<void> addReflection(bool isGood) async {
    final String text = textReflection.value.text;

    /// DBに保存する
    await RequestReflection().addReflection(
      text,
      isGood,
      groupId,
    );

    final candidateNotExist = candidates.value.every((e) => e.text != text);
    if (candidateNotExist) {
      /// 重複しない場合は候補一覧に追加する
      candidates.value = [
        DomainReflection(
          text: text,
          count: 1,
        ),
        ...candidates.value,
      ];
    } else {
      /// 重複する場合はcountを加算する
      candidates.value = candidates.value
          .map(
            (c) => DomainReflection(
              count: text == c.text ? c.count + 1 : c.count,
              text: c.text,
            ),
          )
          .toList();
    }
  }

  /// モーダルで追加を押した
  void onPressedAddModal(BuildContext c, bool candidateExist) {
    if (isGood.value == null && !candidateExist) return;

    /// 振り返りの追加
    addReflection(isGood.value!);

    /// 入力欄をリセットする
    resetInput();

    /// 振り返り種類も初期値に更新
    isGood.value = true;

    /// モーダルを消す
    Navigator.pop(c);
  }

  /// 振り返りの追加を押した
  void onPressedAddReflection(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    final text = textReflection.value.text;
    final candidateExist = !candidates.value.every((e) => e.text != text);
    int count = 1;
    if (candidateExist) {
      final DomainReflection domain = candidates.value.firstWhere(
        (c) => c.text == text,
      );
      count = domain.count;
    }

    /// 追加するモーダルを表示する
    showModal(
      context,
      text,
      candidateExist,
      count,
      (BuildContext c) => onPressedAddModal(c, candidateExist),
      () => {
        isGood.value = true,
      },
      () => {
        isGood.value = false,
      },
    );
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) async {
    textReflection.value.text = text;
    textFieldFocusNode.unfocus();
  }

  /// 振り返りの入力文字を削除
  void onPressedRemoveText() {
    /// 入力欄をリセットする
    resetInput();
  }

  /// 振り返りの終了を押した
  void onPressedReflectionDone() async {
    /// モーダルを消す
  }

  useEffect(() {
    if (reflections.isEmpty) return;

    /// 候補一覧の追加する
    candidates.value = reflections
        .map(
          (d) => DomainReflection(
            text: d.text,
            count: d.count,
          ),
        )
        .toList();
  }, [reflections]);

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    onPressedReflectionDone: onPressedReflectionDone,
    onPressedRemoveText: onPressedRemoveText,
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
    candidates: candidates.value,
    formKey: formKey,
  );
}
