import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/components/templates/ranking/ranking.dart'
    as ranking;

/// ページ: ランキング
class PageRanking extends StatefulWidget {
  const PageRanking({super.key, required this.db});
  final Future<Database> db;

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
      body: ranking.TemplateRanking(),
    );
  }
}
