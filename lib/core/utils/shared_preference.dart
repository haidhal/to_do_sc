import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getReadList() {
    return _prefs!.getStringList("readTodos") ?? [];
  }

  static Future saveReadList(List<String> list) async {
    await _prefs!.setStringList("readTodos", list);
  }
}