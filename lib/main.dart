import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Counter extends ValueNotifier<int> {
  Counter() : super(0) {
    addListener(() => print("count changed 2. /count:$value"));
  }

  void increment() => value++;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Counter();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (_context, count, _child) {
              print("count changed 1. /count:$count");
              return Text('$count',
                  style: Theme.of(context).textTheme.display1);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counter.increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
