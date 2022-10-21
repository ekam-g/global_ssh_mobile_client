import 'package:redis/redis.dart';

import '../check.dart';



Future<List<dynamic>> readAll() async {
  List<dynamic> returnVal = [];
  final values = await getSignIn();
  final conn = RedisConnection();
  await conn
      .connect(values["where"], values["port"])
      .then((Command command) async {
    await command
        .send_object(["AUTH", values["username"], values["pass"]]).then(
            (var response) async {
      await command.send_object([
        "KEYS",
        "*",
      ]).then((var response) async => {
            if (response is List)
              {
                for (var i in response)
                  {
                    await command
                        .send_object(["LRANGE", i, 0, -1]).then((var response) {
                      // print(response);
                      returnVal.add(response);
                    })
                  }
              }
          });
    });
  });
  print(returnVal);
  return returnVal;
}
