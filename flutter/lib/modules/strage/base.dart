import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// KVS
class StrageKVS {
  String key = "";
  StrageKVS(this.key);

  Future<String> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  void save(String v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, v);
  }
}
