// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class coolText extends StatelessWidget {
  const coolText({
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontSize, fontFamily: 'Poppins'),
    );
  }
}
