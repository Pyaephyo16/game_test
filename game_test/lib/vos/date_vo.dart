class DateVO {
  String? date;
  int? weekDay;
  bool? isSelected;


  DateVO({
    this.date,
    this.weekDay,
    this.isSelected=false,
  });

  @override
  String toString() => 'DateVO(date: $date, weekDay: $weekDay, isSelected: $isSelected)';
}
