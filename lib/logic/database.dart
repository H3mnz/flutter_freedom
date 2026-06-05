import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  AppPrefs._();

  static SharedPreferences? _prefs;

  /// Initialize once in main()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get _instance {
    if (_prefs == null) {
      throw Exception(
        'AppPrefs not initialized. Call AppPrefs.init() before using it.',
      );
    }

    return _prefs!;
  }

  //! SAVE METHODS

  static Future<bool> setString(String key, String value) async {
    return await _instance.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _instance.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _instance.setDouble(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _instance.setBool(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _instance.setStringList(key, value);
  }

  /// Save any Map/List/Object as JSON
  static Future<bool> setJson(String key, dynamic value) async {
    final jsonString = jsonEncode(value);

    return await _instance.setString(key, jsonString);
  }

  //! GET METHODS

  static String? getString(String key) {
    return _instance.getString(key);
  }

  static int? getInt(String key) {
    return _instance.getInt(key);
  }

  static double? getDouble(String key) {
    return _instance.getDouble(key);
  }

  static bool? getBool(String key) {
    return _instance.getBool(key);
  }

  static List<String>? getStringList(String key) {
    return _instance.getStringList(key);
  }

  /// Get JSON object
  static dynamic getJson(String key) {
    final jsonString = _instance.getString(key);

    if (jsonString == null) return null;

    return jsonDecode(jsonString);
  }

  //! REMOVE METHODS

  static Future<bool> remove(String key) async {
    return await _instance.remove(key);
  }

  static Future<bool> clearAll() async {
    return await _instance.clear();
  }

  static bool containsKey(String key) {
    return _instance.containsKey(key);
  }

  //! OPTIONAL HELPERS

  static Set<String> getKeys() {
    return _instance.getKeys();
  }

  static dynamic get(String key) {
    return _instance.get(key);
  }
}
