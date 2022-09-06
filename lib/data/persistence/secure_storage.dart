abstract class SecureStorage {
  Future<String?> getExample(String value);
  Future<void> setExample(String value);
  Future<void> deleteAll();
}
