import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences sharedPreferences;

  CacheHelper(this.sharedPreferences);

  /// Get a String value from local storage using the given [key].
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  /// Save a value (bool, String, int, or double) in local storage with the given [key].
  Future<bool> saveData({required String key, required dynamic value}) async {
    switch (value.runtimeType) {
      case const (bool):
        return await sharedPreferences.setBool(key, value);
      case const (String):
        return await sharedPreferences.setString(key, value);
      case const (int):
        return await sharedPreferences.setInt(key, value);
      case const (double):
        return await sharedPreferences.setDouble(key, value);
      default:
        throw ArgumentError("Unsupported data type for SharedPreferences");
    }
  }

  /// Retrieve a value (bool, String, int, or double) from local storage using the given [key].
  dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  /// Remove data associated with the given [key] from local storage.
  Future<bool> removeData(String key) async {
    return await sharedPreferences.remove(key);
  }

  /// Check if a specific [key] exists in local storage.
  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }

  /// Clear all data from local storage.
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
