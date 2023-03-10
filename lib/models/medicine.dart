import 'dart:core';

class Medicine {
  final String name;
  final String? description;
  final int freq;
  final List<DateTime> timeList;
  final int days;

  Medicine(
      {required this.name,
      this.description,
      required this.freq,
      required this.timeList,
      required this.days});
}
