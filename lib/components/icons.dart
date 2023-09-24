import 'package:flutter/material.dart';

Widget iconCorrect() {
  return const CircleAvatar(
    radius: 20,
    backgroundColor: Colors.green,
    child: Icon(
      Icons.check,
      color: Colors.white,
    ),
  );
}

Widget iconWrong() {
  return const CircleAvatar(
    radius: 20,
    backgroundColor: Colors.red,
    child: Icon(
      Icons.close,
      color: Colors.white,
    ),
  );
}
