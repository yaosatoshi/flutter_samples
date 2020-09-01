import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
          create: (context) => _Notifier(), child: MyHomePage()),
    );
  }
}

Future<String> getAsyncString(String fromMessage) async {
  var st = DateTime.now().millisecondsSinceEpoch;
  sleep(Duration(seconds: 2));
  return "getAsyncString() called. ${fromMessage} times. /delay:${DateTime.now().millisecondsSinceEpoch - st}ms";
}

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super("");

  int _counter = 0;
  void action() async {
    value = await compute(getAsyncString, (++_counter).toString());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Compute sample.")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        MyHomePage.of(context, listen: false).action(),
                    child: Text('Action'),
                  ),
                ),
              ),
            ],
          ),
          Text("${MyHomePage.of(context).value}")
        ],
      ),
    );
  }
}
