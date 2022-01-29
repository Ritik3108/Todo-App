// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:todoapp/screen.dart';
import 'package:todoapp/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerFirstName = TextEditingController();

  String firstname = "";

  final List<String> names = <String>[];
  List<bool> _itens = [];
  _loadingItens() {
    _itens = [];
    for (var i = 0; i < 100; i++) {
      _itens.add(false);
    }
  }

  @override
  void initState() {
    _loadingItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const MyScreen(),
          const Divider(
            color: Colors.black,
          ),
          if (names.isEmpty)
            const Task()
          else
            Expanded(
              child: ListView.separated(
                  itemCount: names.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(names[index]),
                      onDismissed: (direction) {
                        names.removeAt(index);
                      },
                      child: ListTile(
                        leading: Text(
                          "       $index     ",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: _itens[index]
                                      ? Text(
                                          "               ${names[index]}",
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          "               ${names[index]}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  activeColor: Colors.green,
                                  checkColor: Colors.white,
                                  value: _itens[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _itens[index] = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        trailing: FlatButton(
                          child: const Text(
                            'DELETE',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              names.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  }),
            ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: _controllerFirstName,
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the Task.."),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 150,
                child: ButtonTheme(
                  height: 58.0,
                  child: FlatButton(
                    child: const Text(
                      '+ ADD',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        String t = _controllerFirstName.text;

                        if (t == '') {
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(content: Text('Enter Something!')),
                          );
                        } else {
                          names.insert(0, _controllerFirstName.text);
                          _controllerFirstName.clear();
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
