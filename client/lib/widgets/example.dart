// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreamOne extends StatelessWidget {
  const StreamOne(
      {required this.stream,
      required this.height,
      required this.whatData,
      required this.onPressed, required this.docs});

  final String stream;
  final double height;
  final String whatData;
  final GestureTapCallback onPressed;
  final String docs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(stream)
            .doc(docs)
            .snapshots(),
        builder: (context, snapshot) {
          DocumentSnapshot doc = snapshot.data as DocumentSnapshot;
          Map<String, dynamic>? display;
          if (!doc.exists) {
            display = {};
          } else {
            display = doc.data() as Map<String, dynamic>;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (!snapshot.hasData) {
            return Center(
              child: Text(display[whatData].toString()),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
