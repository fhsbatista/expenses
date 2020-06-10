extension CurrencyManipulation on double {
  String toCurrency() => "R\$ ${this.toStringAsFixed(2)}";
}
