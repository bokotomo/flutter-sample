/// 指定したmonth分の前の日付を返す
DateTime getMonthAgo(DateTime d, int month) {
  return DateTime(
    d.year,
    d.month,

    /// デバックのため日付にする。debug
    d.day - month,
    d.hour,
    d.minute,
    d.second,
    d.millisecond,
  );
}
