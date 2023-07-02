class UseReturn {
  const UseReturn({
    required this.onClickRow,
  });

  final Function onClickRow;
}

/// ロジック: 振り返り履歴グループ一覧
UseReturn useHooks() {
  void onClickRow() {}

  return UseReturn(
    onClickRow: onClickRow,
  );
}
