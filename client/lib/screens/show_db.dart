import 'package:client/func/redis/read_all.dart';
import 'package:client/screens/more_data.dart';
import 'package:client/widgets/coolText.dart';
import 'package:flutter/material.dart';

import '../widgets/error_display.dart';
import '../widgets/loading.dart';

class ShowDb extends StatefulWidget {
  const ShowDb({Key? key}) : super(key: key);

  @override
  _ShowDbState createState() => _ShowDbState();
}

class _ShowDbState extends State<ShowDb> {
  redis redisVals = redis();

  checkDb() async {
    try {
      redisVals = await redis.readAll();
    } catch (e) {
      error = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(showError);
    }
    setState(() {});
  }

  @override
  void initState() {
    checkDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      redisVals.allKeys[0];
    } catch (e) {
      return const Loading();
    }
    return Scaffold(
      appBar: AppBar(
        title: const coolText(
          text: "Victim's Data",
          fontSize: 16,
        ),
      ),
      body: Center(
          child: SizedBox(
              width: 800,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: redisVals.allKeys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.face_rounded),
                            title: Text("${redisVals.allKeys[index]}"),
                            subtitle: const Text('Click to see more'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreData(
                                        where: redisVals.allKeys[index]
                                            .toString())),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ))),
    );
  }
}
