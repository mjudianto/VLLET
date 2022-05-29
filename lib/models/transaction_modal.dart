class TransactionData {
  final String tname;
  final String type;
  final int amount;
  final DateTime date;
  final String note;

  TransactionData(this.tname, this.type, this.amount, this.date, this.note);

  int get day {
    return date.day;
  }

  int get month {
    return date.month;
  }
}
