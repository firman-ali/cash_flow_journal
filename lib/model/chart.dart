class StatisticData {
  final String cashFlowType;
  final int amount;

  StatisticData({required this.cashFlowType, required this.amount});
}

List<StatisticData> getChartData() {
  final List<StatisticData> chartData = [
    StatisticData(cashFlowType: 'Expense', amount: 1500),
    StatisticData(cashFlowType: 'Income', amount: 1000),
  ];
  return chartData;
}
