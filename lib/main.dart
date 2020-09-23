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
              CountText(),
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

class CountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$this build() called.');
    return Text("${Provider.of<int>(context)}");
  }
}
