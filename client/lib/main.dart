import 'package:client/func/check.dart';
import 'package:client/func/redis/read_all.dart';
import 'package:client/screens/show_db.dart';
import 'package:client/screens/what_db.dart';
import 'package:flutter/material.dart';
import 'package:redis/redis.dart';

Command? redisClient;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool signIn = await check();
  runApp(MyApp(
    sign_in: signIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.sign_in,
  });

  final bool sign_in;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client Keylogger Viewer',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blueGrey,
          onPrimary: Colors.blueGrey,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.black,
          onError: Colors.red,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.blueGrey,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white70)),
      ),
      home: sign_in  ? const ShowDb() : const MyHomePage(),
      // home: const Loading(),
    );
  }
}
