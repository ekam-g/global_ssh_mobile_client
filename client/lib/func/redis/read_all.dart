import 'package:redis/redis.dart';

import '../check.dart';

Future<dynamic> readAll() async {
  dynamic returnVal;
  final values = await getSignIn();
  final conn = RedisConnection();
  conn.connect(values["where"], values["port"]).then((Command command) {
    command.send_object(["AUTH", values["username"], values["pass"]]).then(
        (var response) {
      command.get("keys *").then((var response) => {returnVal = response});
    });
  });
  return returnVal;
}
