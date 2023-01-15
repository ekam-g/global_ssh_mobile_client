import 'package:client/func/redis/read_all.dart';
import 'package:client/screens/more_data.dart';
import 'package:client/screens/what_db.dart';
import 'package:client/widgets/coolButtion.dart';
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
    while (true) {
      try {
        await redisVals.workingServers();
      } catch (e) {
        error = e.toString();
        ScaffoldMessenger.of(context).showSnackBar(showError);
      }
      if (mounted) {
        setState(() {});
      }
      await Future.delayed(const Duration(seconds: 3));
    }
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
    } catch (_) {
      return const Loading(
        text: "Loading:   ",
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.portrait_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
        ),
        title: const coolText(
          text: "Working Servers",
          fontSize: 16,
        ),
      ),
      body: Center(
          child: SizedBox(
              width: 800,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: redisVals.allKeys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.face_rounded),
                            title: Text(redisVals.allKeys[index].toString()),
                            subtitle: const Text('Click to see more'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreData(
                                        where: redisVals.allKeys[index]
                                            .toString()
                                            .toString())),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ))),
    );
  }
}
