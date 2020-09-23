import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  example1_normal();
//  example2_broadcast();
//  example3_transform();

  runApp(MyApp());
}

void example1_normal() {
  final sctrl = StreamController<String>();

  sctrl.stream.listen((event) {
    print("stream data catched. /event:$event");
  });

  sctrl.sink.add("AAA");
  sctrl.sink.add("BBB");
  sctrl.sink.add("CCC");
}

void example2_broadcast() {
  final sctrl = StreamController<String>.broadcast();

  sctrl.stream.listen((event) {
    print("stream data 1 catched. /event:$event");
  });

  sctrl.stream.listen((event) {
    print("stream data 2 catched. /event:$event");
  });

  sctrl.sink.add("AAA");
  sctrl.sink.add("BBB");
  sctrl.sink.add("CCC");
}

void example3_transform() {
  final sctrl = StreamController<String>();

  sctrl.stream.transform(
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    sink.add(value + ':TRANSFORMED');
  })).listen((event) {
    print("stream data catched. /event:$event");
  });

  sctrl.sink.add("AAA");
  sctrl.sink.add("BBB");
  sctrl.sink.add("CCC");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text(""));
  }
}
