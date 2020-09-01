import 'dart:io';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

void _getAsyncStringIsolate(SendPort replyTo) {
  final receivePort = ReceivePort();
  replyTo.send(receivePort.sendPort);
  receivePort.listen((message) {
    final data = message[0] as String;
    final send = message[1] as SendPort;
  });

  var st = DateTime.now().millisecondsSinceEpoch;
  sleep(Duration(milliseconds: 500));
  return "getAsyncString() called. ${++_counter} times. /delay:${DateTime.now().millisecondsSinceEpoch - st}ms";

}

class _Notifier extends ValueNotifier<String> {
  _Notifier() : super("");

  int _counter = 0;

  void action() async {
    value = await getAsyncString();
  }

  Future<String> getAsyncString() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_getAsyncStringIsolate, receivePort.sendPort);

    final sendPort = await receivePort.first as SendPort;
    final answer = ReceivePort();
    sendPort.send([(++_counter).toString(), answer.sendPort]);

    receivePort.listen((message) {

    });
    final users = await answer.first as List<User>;
    return users;
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  static _Notifier of(BuildContext context, {bool listen = true}) =>
      Provider.of<_Notifier>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Isolate sample.")),
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
