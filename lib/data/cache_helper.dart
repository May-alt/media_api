import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Put Data
  static Future<bool> putBoolData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  //get data

  static bool? getBoolData({required  key}) {
    return sharedPreferences.getBool(key);
  }

}
