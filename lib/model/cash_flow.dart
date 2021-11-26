class CashFlow {
  final int? id;
  final String cashFlowType;
  final String categoryType;
  final double amount;
  final String description;

  CashFlow({
    this.id,
    required this.cashFlowType,
    required this.categoryType,
    required this.amount,
    required this.description,
  });

  factory CashFlow.fromJson(Map<String, dynamic> json) => CashFlow(
        id: json["id"],
        cashFlowType: json["cashFlowType"],
        categoryType: json["categoryType"],
        amount: json["amount"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cashFlowType': cashFlowType,
      'categoryType': categoryType,
      'amount': amount,
      'description': description,
    };
  }
}
