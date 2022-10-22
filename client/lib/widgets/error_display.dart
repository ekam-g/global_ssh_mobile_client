import 'package:flutter/material.dart';

import 'coolText.dart';

String error = "Error";

final showError = SnackBar(
  content: coolText(text : "A Error Occurred: $error", fontSize: 10),
);
