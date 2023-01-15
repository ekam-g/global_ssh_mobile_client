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
      if (!allKeysRedis[x].toString().contains("location")) {
        allKeys.add(allKeysRedis[x].toString());
        data.add(works.toString());
      }
    }
  }
  static Future<String> getCommand(String where) async {
    while (true) {
      String data = await readOneKey(where);
      if (data.contains("**")) {
        return data.replaceAll("**", "");
      }
      else if (data.contains("%%")){
        return data.replaceAll("%%", "");
      }
      Future.delayed(const Duration(milliseconds: 4));
    }
  }
}
