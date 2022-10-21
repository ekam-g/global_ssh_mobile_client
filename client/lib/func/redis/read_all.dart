import 'package:redis/redis.dart';

import '../check.dart';

class redis {
  List<dynamic> allKeys = [];
  List<String> values = [];

  static Future<redis> readAll() async {
    redis returnVal = redis();
    final values = await getSignIn();
    final conn = RedisConnection();
    await conn
        .connect(values["where"], values["port"])
        .then((Command command) async {
      await command.send_object(
          ["AUTH", values["username"], values["pass"]]).then((_) async {
        await command.send_object([
          "KEYS",
          "*",
        ]).then((var response) async => {
              returnVal.allKeys = response,
              if (response is List)
                {
                  for (var i in response)
                    {
                      await command
                          .send_object(["LRANGE", i, 0, -1]).then((var all) {
                        returnVal.values.add(all.toString());
                      })
                    }
                }
            });
      });
    });
    print(returnVal.allKeys);
    print(returnVal.values);
    return returnVal;
  }
}
