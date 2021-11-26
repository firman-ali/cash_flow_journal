import 'package:cash_flow_journal/data/database_service.dart';
import 'package:cash_flow_journal/helper/state_helper.dart';
import 'package:cash_flow_journal/model/chart.dart';
import 'package:flutter/cupertino.dart';

class StatisticProvider extends ChangeNotifier {
  StatisticProvider() {
    getStatisticData();
  }

  final DatabaseService _dbHelper = DatabaseService();
  late List<StatisticData> _chartData;
  late ResultState _state;

  List<StatisticData> get chartData => _chartData;
  ResultState get state => _state;

  Future<void> getStatisticData() async {
    _state = ResultState.isLoading;
    notifyListeners();

    final result = await _dbHelper.getStatisticData();
    if (result.length != 2 && result.isNotEmpty) {
      _chartData = [];
      _chartData.add(StatisticData(
          cashFlowType: result[0].cashFlowType, amount: result[0].amount));
      _state = ResultState.hasData;
      notifyListeners();
    } else if (result.length == 2) {
      _chartData = result;
      _state = ResultState.hasData;
      notifyListeners();
    } else {
      _chartData = [];
      _state = ResultState.noData;
      notifyListeners();
    }
  }
}
