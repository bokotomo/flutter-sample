import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/reflection/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/components/templates/reflection/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/reflection/view.dart'
    show view;

/// テンプレート: 振り返り
class TemplateReflection extends HookWidget {
  const TemplateReflection({
    super.key,
    required this.i18n,
    required this.reflectionGroups,
    required this.game,
    required this.pushReflection,
    required this.pushHistory,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// ゲーミフィケーション
  final DomainReflectionGame game;

  /// 振り返り追加ページへ飛ぶ
  final void Function(BuildContext, String, int) pushReflection;

  /// 振り返り履歴ページへ飛ぶ
  final void Function(BuildContext, String, int) pushHistory;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      reflectionGroups,
      game,
      pushReflection,
      pushHistory,
    );

    return view(
      i18n,
      context,
      reflectionGroups,
      h.expText(),
      game.rank,
      h.gaugePercent,
      h.onPressedStart,
      h.onPressedHistory,
    );
  }
}
