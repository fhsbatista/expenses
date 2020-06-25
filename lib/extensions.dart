extension CurrencyManipulation on double {
  String toCurrency() => "R\$ ${this.toStringAsFixed(2)}";
}

extension DateExtensions on DateTime {
  bool isSameDayThat(DateTime dateToCompare) {
    bool isSameDay = this.day == dateToCompare.day;
    bool isSameMonth = this.month == dateToCompare.month;
    bool isSameYear = this.year == dateToCompare.year;
    return isSameDay && isSameMonth && isSameYear;
  }
}
