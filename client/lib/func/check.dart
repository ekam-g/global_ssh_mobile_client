import 'package:client/func/redis/read_all.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final String? pas = prefs.getString('redis_pass');
    final String? key = prefs.getString('redis_username');
    final String? url = prefs.getString('redis_location');
    final int? port = prefs.getInt('redis_port');
    if (pas == null || key == null || url == null || port == null) {
      return false;
    }
    await Redis.makeClient();
    return true;
  } catch(e) {
    if (kDebugMode) {
      print (e);
    }
    return false;
  }
}

Future<void> newSignIn(
    String pass, String username, String where, String port) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('redis_location', where);
  prefs.setString('redis_pass', pass);
  prefs.setString('redis_username', username);
  prefs.setInt('redis_port', int.parse(port));
}

Future<Map<String, dynamic>> getSignIn() async {
  final prefs = await SharedPreferences.getInstance();
  final String? pass = prefs.getString('redis_pass');
  final String? username = prefs.getString('redis_username');
  final String? where = prefs.getString('redis_location');
  final int? port = prefs.getInt('redis_port');
  if (pass == null || username == null || where == null || port == null) {
    throw "null error";
  }
  return {
    'pass': pass,
    'username': username,
    'where': where,
    'port': port,
  };
}
