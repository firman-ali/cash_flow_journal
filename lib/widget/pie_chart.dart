import 'package:cash_flow_journal/helper/state_helper.dart';
import 'package:cash_flow_journal/model/chart.dart';
import 'package:cash_flow_journal/provider/statistic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PieChart extends StatelessWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          final List<StatisticData> _statisticData = provider.chartData;
          return SizedBox(
            height: 200,
          );
        } else if (provider.state == ResultState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final List<StatisticData> _statisticData = [
            StatisticData(cashFlowType: 'Expense', amount: 1000),
            StatisticData(cashFlowType: 'Income', amount: 1000)
          ];
          return SizedBox(
            height: 200,
          );
        }
      },
    );
  }
}
