import 'package:client/main.dart';
import 'package:redis/redis.dart';

import '../check.dart';

class redis {
  List<String> allKeys = [];
  List<String> data = [];

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
  }
  static Future<String> readOneKey(String where) async {
    return await redisClient!.send_object(["GET", where,]);
  }
  Future<dynamic> workingServers() async {
    allKeys = [];
    final List<dynamic> allKeysRedis = await redisClient!.send_object(["KEYS", "*",]);
    for (int x = 0; x < allKeysRedis.length; x++) {
      dynamic works = await readOneKey(allKeysRedis[x].toString());
      if (works.toString().contains("**")) {
        allKeys.add(allKeysRedis[x].toString());
      }
    }
  }
}
