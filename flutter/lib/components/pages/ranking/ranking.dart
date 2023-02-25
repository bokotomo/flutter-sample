import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/ranking/ranking.dart'
    show TemplateRanking;

/// ページ: ランキング
class PageRanking extends StatefulWidget {
  const PageRanking({super.key});

  @override
  State<PageRanking> createState() => _PageRankingState();
}

/// _PageRankingState
class _PageRankingState extends State<PageRanking> {
  @override
  void initState() {
    print("PageRanking");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateRanking(),
    );
  }
}
