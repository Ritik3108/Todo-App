import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 300,
        height: 200,
        alignment: Alignment.center,
        child: const Text(
          "NO TASK TO DO!",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
