import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// KVS
class StrageKVS {
  String key = "";
  StrageKVS(this.key);

  Future<String?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> save(String v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, v);
  }
}

/// KVS
class StrageKVSNumber {
  String key = "";
  StrageKVSNumber(this.key);

  Future<int?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<void> save(int v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, v);
  }
}
