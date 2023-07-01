/// 指定したmonth分の前の日付を返す
DateTime getMonthAgo(DateTime d, int month) {
  return DateTime(
    d.year,
    d.month - month,
    d.day,
    d.hour,
    d.minute,
    d.second,
    d.millisecond,
  );
}
