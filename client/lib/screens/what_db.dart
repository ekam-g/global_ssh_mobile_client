import 'package:client/widgets/coolButtion.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Please Sign In Your Redis Server"),
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
                    hintText: 'Redis Key',
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
                    hintText: 'Redis Key',
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
                    hintText: 'Redis Key',
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
                    hintText: 'Redis Key',
                  ),
                ),
              ),
              const Spacer(),

              ExpandedButton(
                  onPressed: () {
                    debugPrint(redis1.text);
                    debugPrint(redis2.text);
                    debugPrint(redis3.text);
                    debugPrint(redis4.text);

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
