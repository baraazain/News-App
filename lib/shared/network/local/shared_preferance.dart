import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedpreferenceses;

  static init() async {
    sharedpreferenceses = await SharedPreferences.getInstance();
  }

  static Future<bool> putMode({
    required String key,
    required int value,
  }) async {
    return await sharedpreferenceses!.setInt(key, value);
  }

  static int? getMode({
    required String key,
  }) {
    return sharedpreferenceses!.getInt(key);
  }
}
