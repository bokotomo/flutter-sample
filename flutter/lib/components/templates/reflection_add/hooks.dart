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
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/domain/reflection_add/candidate.dart'
    show DomainCandidate;
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
  final List<DomainCandidate> candidates;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
}

///
UseReturn useHooks(List<DomainReflection> reflections) {
  final FocusNode textFieldFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  ValueNotifier<List<DomainCandidate>> candidates =
      useState<List<DomainCandidate>>([]);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool?> isGood = useState<bool?>(true);

  /// 振り返りの追加
  Future<void> addReflection(bool v) async {
    final String text = textReflection.value.text;

    /// DBに保存する
    await RequestReflection().addReflection(
      text,
      v,
    );

    final candidateNotExist = candidates.value.every((e) => e.text != text);
    if (candidateNotExist) {
      /// 重複しない場合は候補一覧に追加する
      candidates.value = [
        DomainCandidate(
          text: text,
          count: 1,
        ),
        ...candidates.value,
      ];
    } else {
      /// 重複する場合はcountを加算する
      candidates.value = candidates.value
          .map(
            (c) => DomainCandidate(
              count: text == c.text ? c.count + 1 : c.count,
              text: c.text,
            ),
          )
          .toList();
    }

    /// 入力欄をリセットする
    formKey.currentState?.reset();
  }

  /// モーダルで追加を押した
  void onPressedAddModal(BuildContext c, bool candidateExist) {
    if (isGood.value == null && !candidateExist) return;
    addReflection(isGood.value!);

    Navigator.pop(c);
  }

  /// 振り返りの追加を押した
  void onPressedAddReflection(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    final text = textReflection.value.text;
    final candidateExist = !candidates.value.every((e) => e.text != text);
    int count = 1;
    if (candidateExist) {
      final DomainCandidate domain = candidates.value.firstWhere(
        (c) => c.text == text,
      );
      count = domain.count + 1;
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
    formKey.currentState?.reset();
  }

  /// 振り返りの終了を押した
  void onPressedReflectionDone() async {}

  useEffect(() {
    if (reflections.isEmpty) return;

    /// 候補一覧の追加する
    candidates.value = reflections
        .map(
          (d) => DomainCandidate(
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
