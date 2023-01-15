import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String text;
  const Loading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Expanded(
              flex: 1,
              child: Image(
                image: AssetImage("lib/assets/hecker-removebg-preview.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                coolText(text: text, fontSize: 30),
                const CircularProgressIndicator(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
