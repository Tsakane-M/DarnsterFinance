import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _store = const FlutterSecureStorage();

  @override
  Future<String?> getExample(String value) async {
    return await _store.read(key: _SecureStorageKey.example.name);
  }

  @override
  Future<void> setExample(String value) async {
    await _store.write(key: _SecureStorageKey.example.name, value: value);
  }

  @override
  Future<void> deleteAll() async {
    // Either wipe the storage, or delete specific keys

    // for (final _SecureStorageKey key in _SecureStorageKey.values) {
    //   await _store.delete(key: key.name);
    // }

    await _store.deleteAll();
  }
}

enum _SecureStorageKey { example }
