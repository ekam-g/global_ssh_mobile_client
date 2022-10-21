import 'package:client/func/redis/read_all.dart';
import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';

class ShowDb extends StatefulWidget {
  const ShowDb({Key? key}) : super(key: key);

  @override
  _ShowDbState createState() => _ShowDbState();
}

class _ShowDbState extends State<ShowDb> {

  checkDb() async {
    try {
      redis.readAll();
    }catch(e){

    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
              width: 500,
              child: Column(
                children: [
                  Container(),
                ],
              ))),
    );
  }
}
