import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class CounterData {
  int counter = 0;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StreamController sctrl = StreamController<int>();
    int count = 0;
    return MaterialApp(
        home: StreamProvider<int>(
      initialData: 0,
      create: (_) => sctrl.stream,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<int>(builder: (context, value, _) => Text("$value")),
              RaisedButton(
                onPressed: () => sctrl.sink.add(++count),
                child: Text('Update Counter'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
