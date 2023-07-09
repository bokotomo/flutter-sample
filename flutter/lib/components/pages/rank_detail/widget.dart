import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/rank_detail/widget.dart'
    show TemplateRankDetail;
import 'package:gamer_reflection/modules/const/rank/rank_system.dart'
    show constantRankSystems;

/// ページ: ランクの説明
class PageRankDetail extends HookWidget {
  const PageRankDetail({
    super.key,
    required this.i18n,
  });

  /// 言語
  final AppLocalizations i18n;

  @override
  Widget build(BuildContext context) {
    final ranks = constantRankSystems(i18n);

    return Scaffold(
      body: TemplateRankDetail(
        i18n: i18n,
        ranks: ranks,
      ),
    );
  }
}
