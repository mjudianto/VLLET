class TransactionModel {
  final String tname;
  int amount;
  final String note;
  final DateTime date;
  final String type;

  addAmount(int amount) {
    this.amount = this.amount + amount;
  }

  TransactionModel(this.tname,this.type,this.amount, this.date ,this.note,);
}
