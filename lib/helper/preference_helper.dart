import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const REGISTERED_NAME = 'REGISTERED_NAME';
  static const REGISTERED_EMAIL = 'REGISTERED_EMAIL';

  Future<bool> get isRegistered async {
    final prefs = await sharedPreferences;
    if (prefs.getString(REGISTERED_NAME) != null &&
        prefs.getString(REGISTERED_EMAIL) != null) {
      return true;
    } else {
      return false;
    }
  }

  void registerData(String name, String email) async {
    final prefs = await sharedPreferences;
    prefs.setString(REGISTERED_NAME, name);
    prefs.setString(REGISTERED_EMAIL, email);
  }

  Future<Map<String, String>> get getRegisteredData async {
    final _prefs = await sharedPreferences;
    final _name = _prefs.getString(REGISTERED_NAME);
    final _email = _prefs.getString(REGISTERED_EMAIL);

    return {
      REGISTERED_NAME: _name!,
      REGISTERED_EMAIL: _email!,
    };
  }
}
