import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: const Text(
        "TODO APP",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
