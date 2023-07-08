import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        TextEditingController,
        GlobalKey,
        FormState,
        ListView,
        EdgeInsets,
        Icons,
        Form;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/solution_detail/organisms/top.dart'
    show SolutionDetailTop;
import 'package:gamer_reflection/components/templates/solution_detail/organisms/top_edit.dart'
    show SolutionDetailTopEdit;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/domain/solution_detail/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  BuildContext context,
  bool todoExist,
  FocusNode titleFocusNode,
  FocusNode detailFocusNode,
  DomainSolutionDetailReflection? reflection,
  bool isEditMode,
  Function toggleEditMode,
  TextEditingController titleController,
  TextEditingController detailController,
  GlobalKey<FormState> formKey,
  final String groupValue,
  void Function() onPressedEditDone,
  void Function(BuildContext) onPressedDone,
  void Function() onPressedCancel,
  final Function(String?) onChangedGood,
  final Function(String?) onChangedBad,
  final Function() onPressedToggleTodo,
) {
  // タスク詳細のView
  ListView content = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      SolutionDetailTop(
        i18n: i18n,
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        icon: Icons.edit,
        text: "編集する", // TODO: 言語
        onPressed: () => toggleEditMode(),
      ),
      SpacerHeight.xm,
      ButtonCancel(
        text: todoExist ? "やることから外す" : "やることに追加する",
        onPressed: () async => await onPressedToggleTodo(),
      ),
      SpacerHeight.xm,
    ],
  );

  // 編集可能なView
  ListView editContent = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      SolutionDetailTopEdit(
        i18n: i18n,
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        groupValue: groupValue,
        titleController: titleController,
        detailController: detailController,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        icon: Icons.check_circle,
        text: "編集を完了",
        onPressed: () => onPressedEditDone(),
      ),
      SpacerHeight.xm,
      ButtonCancel(
        text: "キャンセル",
        onPressed: () => onPressedCancel(),
      ),
      SpacerHeight.xm,
    ],
  );

  Form form = Form(
    key: formKey,
    child: editContent,
  );

  return BaseLayout(
    title: "振り返り詳細",
    isBackGround: false,
    onClickDoneButton: isEditMode ? null : () => onPressedDone(context),
    onTap: () => {
      titleFocusNode.unfocus(),
      detailFocusNode.unfocus(),
    },
    child: isEditMode ? form : content,
  );
}
