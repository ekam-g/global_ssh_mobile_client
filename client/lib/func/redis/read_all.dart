import 'dart:io';

import 'package:client/main.dart';
import 'package:redis/redis.dart';

import '../check.dart';

class redis {
  List<dynamic> allKeys = [];
  List<List<dynamic>> values = [];

  static Future<void> makeClient () async {
    final values = await getSignIn();
    final conn = RedisConnection();
    await conn
        .connect(values["where"], values["port"])
        .then((Command command) async {
      await command.send_object(
          ["AUTH", values["username"], values["pass"]]);
      redisClient = command;
    });
    throw "redis error";
  }
  static Future<String> readOneKey(String where) async {
    return await redisClient.send_object(["GET", where,]);
  }
  static Future<dynamic> workingServers() async {
    List<String> workingServers = [];
    final List<String> allKeys = await redisClient.send_object(["KEYS", "*",]);
    for (int x = 0; x < allKeys.length; x++) {
      String works = await readOneKey(allKeys[x]);
      if (works.contains("**")) {
        workingServers.add(allKeys[x]);
      }
    }
  }
}
