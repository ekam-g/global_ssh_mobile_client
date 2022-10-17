import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final String? pas = prefs.getString('redis_pass');
    final String? key = prefs.getString('redis_key');
    if (pas == null || key == null) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}
