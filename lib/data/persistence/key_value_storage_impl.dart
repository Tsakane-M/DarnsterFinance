import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_storage.dart';

class KeyValueStorageImpl implements KeyValueStorage {
  @override
  Future<String?> getExample(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_KeyValueStorageKey.example.name);
  }

  @override
  Future<void> setExample(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_KeyValueStorageKey.example.name, value);
  }

  @override
  Future<void> deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    for (final _KeyValueStorageKey key in _KeyValueStorageKey.values) {
      await prefs.remove(key.name);
    }
  }
}

enum _KeyValueStorageKey { example }
