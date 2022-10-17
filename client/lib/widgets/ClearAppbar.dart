// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class clearAppBar extends StatelessWidget {
  const clearAppBar({super.key, required this.text, required this.fontSize});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class clearAppBarWithButtion extends StatelessWidget {
  const clearAppBarWithButtion({super.key, required this.text, required this.fontSize, required this.onPressed, required this.whaticon});

  final String text;
  final double fontSize;
  final GestureTapCallback onPressed;
  final IconData whaticon;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: IconButton(
        icon:  Icon(whaticon, color: Colors.black),
        onPressed: onPressed,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class clearAppBarNo extends StatelessWidget {
  const clearAppBarNo({super.key, required this.text, required this.fontSize});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      title: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}