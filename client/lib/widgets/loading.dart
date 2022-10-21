import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Spacer(),
        Expanded(
          flex: 1,
          child: Image(
            image: AssetImage("lib/assets/hecker-removebg-preview.png"),
          ),
        ),
        coolText(text: "Loading......", fontSize: 30),
        Spacer(),
      ],
    );
  }
}
