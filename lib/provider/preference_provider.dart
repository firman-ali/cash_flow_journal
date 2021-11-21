import 'package:cash_flow_journal/helper/preference_helper.dart';
import 'package:cash_flow_journal/helper/state_helper.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getStatus();
  }

  late ResultState _resultState;
  late bool _isRegistered;

  ResultState get state => _resultState;
  bool get isRegitered => _isRegistered;

  void _getStatus() async {
    _resultState = ResultState.isLoading;
    notifyListeners();
    final result = await preferencesHelper.isRegistered;
    if (result) {
      _isRegistered = result;
      _resultState = ResultState.hasData;
      notifyListeners();
    } else {
      _resultState = ResultState.noData;
      notifyListeners();
    }
  }

  void registerData(String name, String email) {
    preferencesHelper.registerData(name, email);
    _getStatus();
  }
}
