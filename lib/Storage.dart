import 'package:shared_preferences/shared_preferences.dart';

class MyStorage {
  static final String _KEY = "MYPREFERENCE";

  void save(String dat) async {
    print("save() called. /data:$dat");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_KEY, dat);
  }

  Future<String> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final ret = prefs.getString(_KEY) ?? "(No data found.)";
    print("load() called. /ret:$ret");
    return ret;
  }
}
