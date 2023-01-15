import 'package:client/func/check.dart';
import 'package:client/screens/what_db.dart';
import 'package:client/screens/workingServers.dart';
import 'package:flutter/material.dart';
import 'package:redis/redis.dart';

Command? redisClient;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool signIn = await check();
  runApp(MyApp(
    signIn: signIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.signIn,
  });

  final bool signIn;

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
      home: signIn ? const ShowDb() : const MyHomePage(),
      // home: const Loading(),
    );
  }
}
