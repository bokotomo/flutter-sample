import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// KVS
class StrageKVS {
  String key = "";
  StrageKVS(this.key);

  Future<int> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  void save(int v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, v);
  }
}

final selectedTaskpagePeriod = StrageKVS("selected_taskpage_period");
