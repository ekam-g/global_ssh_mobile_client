import 'package:client/screens/show_db.dart';
import 'package:client/widgets/coolButtion.dart';
import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../func/check.dart';
import '../func/redis/read_all.dart';
import '../widgets/error_display.dart';

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
                flex: 8,
                child: Image(
                  image: AssetImage("lib/assets/hecker-removebg-preview.png"),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: redis2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis username',
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: redis1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis password',
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 65,
                child: TextField(
                  controller: redis3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Redis url',
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 65,
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
                    try {
                      await newSignIn(
                          redis1.text, redis2.text, redis3.text, redis4.text);
                      if (mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowDb()),
                        );
                      }
                    } catch (e) {
                      error = e.toString();
                      ScaffoldMessenger.of(context).showSnackBar(showError);
                    }
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
