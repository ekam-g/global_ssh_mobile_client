import 'package:client/func/redis/read_all.dart';
import 'package:client/widgets/coolButtion.dart';
import 'package:flutter/material.dart';

import '../widgets/error_display.dart';
import '../widgets/loading.dart';

class MoreData extends StatefulWidget {
  const MoreData({Key? key, required this.where}) : super(key: key);
  final String where;

  @override
  _MoreDataState createState() => _MoreDataState();
}

class _MoreDataState extends State<MoreData> {
  double fontSize = 12;
  List<String> shellData = [];
  bool allowedSend = false;
  TextEditingController textController = TextEditingController();
  String path = "Loading.....";
  ScrollController controller = ScrollController();

  update() async {
    String oldData = "";
    while (true) {
      try {
        String data = await Redis.getCommand(widget.where);
        if (oldData != data) {
          allowedSend = true;
          shellData.add(data);
          oldData = data;
          path = await Redis.getPath(widget.where);
          if (mounted) {
            setState(() {});
          }
        }
      } catch (e) {
        if (mounted) {
          error = e.toString();
          ScaffoldMessenger.of(context).showSnackBar(showError);
        }
      }
    }
  }

  send() async {
    if (allowedSend) {
      RedisCommand.sendCommand(widget.where, textController.text);
      textController.clear();
      allowedSend = false;
      controller.jumpTo(shellData.length.toDouble());
    }
  }

  @override
  void initState() {
    update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      shellData[0];
    } catch (e) {
      return const Loading(
        text: "Waiting:  ",
      );
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    fontSize -= 0.5;
                  });
                },
                icon: const Icon(Icons.exposure_minus_1, color: Colors.white)),
            IconButton(
                onPressed: () {
                  setState(() {
                    fontSize += 0.5;
                  });
                },
                icon: const Icon(
                  Icons.plus_one_sharp,
                  color: Colors.white,
                )),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            // Put icon of your preference.
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "${widget.where} in $path",
            style: TextStyle(fontSize: fontSize + 2, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: ListView.builder(
                    controller: controller,
                itemCount: shellData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        shellData[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: TextField(
                      onSubmitted: (val) async {
                if (val.isNotEmpty) {
                  await send();
                }
              },
              controller: textController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white, fontSize: fontSize),
                  hintText: "Enter Command"),
            )),
                const Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      const Spacer(),
                      ExpandedButtonRow(
                          onPressed: () {
                        RedisCommand.kill(widget.where);
                      },
                      text: "Kill Command",
                      flex: 4,
                      fontSize: fontSize,
                      height: 80),
                      const Spacer(),
                      ExpandedButtonRow(
                          onPressed: () {
                        send();
                      },
                      text: "send",
                      flex: 4,
                      fontSize: fontSize,
                      height: 80),
                      const Spacer(),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            )));
  }
}
