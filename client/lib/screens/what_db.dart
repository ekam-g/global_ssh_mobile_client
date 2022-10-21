import 'package:client/widgets/coolButtion.dart';
import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';

import '../func/check.dart';
import '../func/redis/read_all.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController redis1 = TextEditingController();
  TextEditingController redis2 = TextEditingController();
  TextEditingController redis3 = TextEditingController();
  TextEditingController redis4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const coolText(
          text: "Please Sign In Your Redis Server",
          fontSize: 16,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Expanded(
                flex: 5,
                child: Image(
                  image: AssetImage("lib/assets/hecker-removebg-preview.png"),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: redis1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis password',
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: redis2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis username',
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: redis3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis url',
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: redis4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis port',
                  ),
                ),
              ),
              const Spacer(),
              ExpandedButton(
                  onPressed: () async {
                    //String pass, String username, String where, String port
                    await newSignIn(
                        redis1.text, redis2.text, redis3.text, redis4.text);
                    await redis.readAll();
                  },
                  text: "Set",
                  flex: 2,
                  fontSize: 12,
                  width: 200),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
