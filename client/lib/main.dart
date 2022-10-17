import 'package:client/screens/what_db.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client Keylogger Viewer',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blueGrey,
          onPrimary: Colors.blueGrey,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.black,
          onError: Colors.red,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.blueGrey,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white70)),
      ),
      home: const MyHomePage(),
    );
  }
}
