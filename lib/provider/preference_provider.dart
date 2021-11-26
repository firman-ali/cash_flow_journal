import 'package:cash_flow_journal/helper/preference_helper.dart';
import 'package:cash_flow_journal/helper/state_helper.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getStatus();
  }

  late String _resultData;
  late ResultState _resultState;
  late bool _isRegistered;

  String get result => _resultData;
  ResultState get state => _resultState;
  bool get isRegitered => _isRegistered;

  void _getStatus() async {
    _resultState = ResultState.isLoading;
    notifyListeners();
    final result = await preferencesHelper.isRegistered;
    if (result) {
      _isRegistered = result;
      _getRegisteredData();
      _resultState = ResultState.hasData;
      notifyListeners();
    } else {
      _resultState = ResultState.noData;
      notifyListeners();
    }
  }

  void registerData(String name) {
    preferencesHelper.registerData(name);
    _getStatus();
  }

  void _getRegisteredData() async {
    _resultState = ResultState.isLoading;
    notifyListeners();
    final result = await preferencesHelper.getRegisteredData;
    _resultData = result;
    _resultState = ResultState.hasData;
    notifyListeners();
  }
}
