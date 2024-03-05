abstract class KeyValueStorage {
  Future<bool> getTheme();
  Future<void> setTheme(bool isDarkThemeOn);
  Future<void> deleteAll();
}
