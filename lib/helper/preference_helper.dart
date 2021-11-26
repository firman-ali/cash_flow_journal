import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const REGISTERED_NAME = 'REGISTERED_NAME';

  Future<bool> get isRegistered async {
    final prefs = await sharedPreferences;
    if (prefs.getString(REGISTERED_NAME) != null) {
      return true;
    } else {
      return false;
    }
  }

  void registerData(String name) async {
    final prefs = await sharedPreferences;
    prefs.setString(REGISTERED_NAME, name);
  }

  Future<String> get getRegisteredData async {
    final _prefs = await sharedPreferences;
    return _prefs.getString(REGISTERED_NAME)!;
  }
}
