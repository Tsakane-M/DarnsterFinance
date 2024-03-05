import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_storage.dart';

class KeyValueStorageImpl implements KeyValueStorage {
  @override
  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_KeyValueStorageKey.theme.name) ?? true;
  }

  @override
  Future<void> setTheme(bool isDarkThemeOn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_KeyValueStorageKey.theme.name, isDarkThemeOn);
  }

  @override
  Future<void> deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    for (final _KeyValueStorageKey key in _KeyValueStorageKey.values) {
      await prefs.remove(key.name);
    }
  }
}

enum _KeyValueStorageKey {
  theme,
}
